package live

import (
	"bufio"
	"cabrito/types"
	_ "embed"
	"encoding/csv"
	"fmt"
	"github.com/disintegration/imaging"
	"golang.org/x/text/cases"
	"golang.org/x/text/language"
	"image"
	"image/png"
	"io"
	"log"
	"net/http"
	"os"
	"path/filepath"
	"regexp"
	"strings"
	"time"
)

func (api *Api) IptvOrg(w http.ResponseWriter, r *http.Request) {
	api.jobs.iptvOrg.Mu.Lock()
	defer api.jobs.iptvOrg.Mu.Unlock()

	if api.jobs.iptvOrg.Running {
		http.Error(w, "Job is already running", http.StatusConflict)
		return
	}

	api.jobs.iptvOrg.Running = true
	go api.iptvOrgJob()

	w.WriteHeader(http.StatusAccepted)
	w.Write([]byte("Job started"))
}

func (api *Api) iptvOrgJob() {
	api.iptvOrgRefreshCategories()
	api.iptvOrgRefreshChannels()

	api.jobs.iptvOrg.Mu.Lock()
	api.jobs.iptvOrg.Running = false
	api.jobs.iptvOrg.Mu.Unlock()
}

func (api *Api) iptvOrgRefreshCategories() {
	channelsFile := ".data/iptv-org/categories.csv"

	// Download CSV file
	if err := downloadFile(
		channelsFile,
		"https://raw.githubusercontent.com/iptv-org/database/master/data/categories.csv",
	); err != nil {
		fmt.Println("Error downloading CSV file:", err)
		return
	}

	// Open CSV file
	csvfile, err := os.Open(channelsFile)
	if err != nil {
		fmt.Println("Error opening CSV file:", err)
		return
	}
	defer csvfile.Close()

	// Create a CSV reader
	csvReader := csv.NewReader(bufio.NewReader(csvfile))
	csvReader.FieldsPerRecord = 2

	_, _ = csvReader.Read() // first row is the header

	// Read and insert CSV records
	for {
		record, err := csvReader.Read()
		if err == io.EOF {
			break
		}
		if err != nil {
			fmt.Println("Error reading CSV record:", err)
			return
		}

		category := types.IptvOrgCategory{
			Id:   record[0],
			Name: record[1],
		}

		log.Println(category)

		_ = api.db.LiveStreamCategory.Save(&category)
	}

}

func (api *Api) iptvOrgRefreshChannels() {
	channelsFile := ".data/iptv-org/channels.csv"

	// Download CSV file
	if err := downloadFile(
		channelsFile,
		"https://raw.githubusercontent.com/iptv-org/database/master/data/channels.csv",
	); err != nil {
		fmt.Println("Error downloading CSV file:", err)
		return
	}

	// Open CSV file
	csvfile, err := os.Open(channelsFile)
	if err != nil {
		fmt.Println("Error opening CSV file:", err)
		return
	}
	defer csvfile.Close()

	// Create a CSV reader
	csvReader := csv.NewReader(bufio.NewReader(csvfile))
	csvReader.FieldsPerRecord = 17

	_, _ = csvReader.Read() // first row is the header

	regex := regexp.MustCompile("[^a-zA-Z0-9]+")

	// Read and insert CSV records
	for {
		record, err := csvReader.Read()
		if err == io.EOF {
			break
		}
		if err != nil {
			fmt.Println("Error reading CSV record:", err)
			return
		}

		channel := types.IptvOrgChannel{
			Id:            record[0],
			Name:          record[1],
			AltNames:      record[2],
			Network:       record[3],
			Owners:        record[4],
			Country:       record[5],
			Subdivision:   record[6],
			City:          record[7],
			BroadcastArea: record[8],
			Languages:     record[9],
			Categories:    record[10],
			IsNsfw:        record[11],
			Launched:      record[12],
			Closed:        record[13],
			Replaced_by:   record[14],
			Website:       record[15],
			Logo:          record[16],
		}

		caser := cases.Title(language.English)

		channel.Id = strings.ReplaceAll(caser.String(channel.Country)+caser.String(channel.Name), " ", "")
		channel.Id = regex.ReplaceAllString(channel.Id, "")

		if channel.Country == "UK" {
			channel.Country = "GB"
		}

		log.Println(channel)

		_ = api.db.LiveStreamChannel.Save(&channel)

		if channel.Categories != "" {
			categories := strings.Split(channel.Categories, ";")

			for i := 0; i < len(categories); i++ {
				_ = api.db.LiveStreamChannelCategory.Save(channel.Id, categories[i])
			}
		}

		if channel.Logo != "" {
			err := downloadLogo(&channel)
			if err != nil {
				continue
			}
		}
	}
}

func downloadFile(filePath string, url string) error {
	// Extract the directory part from the filepath
	dir := filepath.Dir(filePath)

	// Create all necessary directories
	err := os.MkdirAll(dir, os.ModePerm)
	if err != nil {
		return err
	}

	// Create file
	file, err := os.Create(filePath)
	if err != nil {
		return err
	}
	defer file.Close()

	// Download CSV
	resp, err := http.Get(url)
	if err != nil {
		return err
	}
	defer resp.Body.Close()

	// Write contents to file
	_, err = io.Copy(file, resp.Body)
	if err != nil {
		return err
	}

	return nil
}

func downloadLogo(channel *types.IptvOrgChannel) error {
	log.Printf("logo url: %s - %s", channel.Id, channel.Logo)

	// Download the image from URL
	// Create a new GET request with headers
	req, err := http.NewRequest("GET", channel.Logo, nil)
	if err != nil {
		log.Fatalf("Error creating request: %v", err)
	}

	const userAgent = "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/124.0.0.0 Safari/537.36"

	req.Header.Add("User-Agent", userAgent) // Example header
	req.Header.Add("Accept", "*/*")
	req.Header.Add("Accept-Encoding", "br, deflate, gzip, x-gzip")
	req.Header.Add("content-length", "0")

	// Perform the request
	client := &http.Client{
		Timeout: 5 * time.Second,
	}
	resp, err := client.Do(req)
	if err != nil {
		log.Printf("Error sending request: %v", err)
		return err
	}
	defer resp.Body.Close()

	// Check response status
	if resp.StatusCode != http.StatusOK {
		log.Printf("Error: unexpected status code %d", resp.StatusCode)
		return err
	}

	contentType := resp.Header.Get("Content-Type")
	var img image.Image
	var format string

	switch {
	case strings.HasPrefix(contentType, "image/jpeg"):
		img, format, err = image.Decode(resp.Body)
		if err != nil {
			log.Printf("Error decoding JPEG image: %v - %s", err, format)
			return err
		}
	case strings.HasPrefix(contentType, "image/png"):
		img, format, err = image.Decode(resp.Body)
		if err != nil {
			log.Printf("Error decoding PNG image: %v- %s", err, format)
			return err
		}
	case strings.HasPrefix(contentType, "image/webp"):
		img, format, err = image.Decode(resp.Body)
		if err != nil {
			log.Printf("Error decoding WEBP image: %v- %s", err, format)
			return err
		}
	default:
		log.Printf("Unsupported content type: %s", contentType)
		return err
	}

	// image to grayscale
	//grayscaleImage := imaging.Grayscale(img)
	//
	//if AverageLuminance(grayscaleImage) < 20.0 {
	//	grayscaleImage = imaging.Invert(grayscaleImage)
	//}

	// resize the image
	imgLogo := imaging.Resize( /*grayscaleImage*/ img, 0, 32, imaging.Lanczos)

	filePath := ".data/live/channel-logo/" + channel.Country + "/" + channel.Id + ".png"

	// Extract the directory part from the filepath
	dir := filepath.Dir(filePath)

	// Create all necessary directories
	err = os.MkdirAll(dir, os.ModePerm)
	if err != nil {
		return err
	}

	outFile, err := os.Create(filePath)
	if err != nil {
		log.Fatalf("Error creating output file: %v", err)
	}
	defer outFile.Close()

	err = png.Encode(outFile, imgLogo)
	if err != nil {
		log.Fatalf("Error encoding image to PNG: %v", err)
	}

	return nil
}

// AverageLuminance calculates the average luminance of a grayscale image.
func AverageLuminance(img image.Image) float64 {
	bounds := img.Bounds()
	totalLuminance := 0.0
	totalPixels := float64(bounds.Dx() * bounds.Dy())

	for y := bounds.Min.Y; y < bounds.Max.Y; y++ {
		for x := bounds.Min.X; x < bounds.Max.X; x++ {
			r, g, b, _ := img.At(x, y).RGBA()
			// Convert RGB to luminance (Y in YCbCr color space approximation)
			luminance := 0.299*float64(r) + 0.587*float64(g) + 0.114*float64(b)
			totalLuminance += luminance
		}
	}

	return totalLuminance / totalPixels
}
