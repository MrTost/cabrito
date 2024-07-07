package types

type IptvOrgChannel struct {
	Id            string `csv:"id"`
	Name          string `csv:"name"`
	AltNames      string `csv:"alt_names"`
	Network       string `csv:"network"`
	Owners        string `csv:"owners"`
	Country       string `csv:"country"`
	Subdivision   string `csv:"subdivision"`
	City          string `csv:"city"`
	BroadcastArea string `csv:"broadcast_area"`
	Languages     string `csv:"languages"`
	Categories    string `csv:"categories"`
	IsNsfw        string `csv:"is_nsfw"`
	Launched      string `csv:"launched"`
	Closed        string `csv:"closed"`
	Replaced_by   string `csv:"replaced_by"`
	Website       string `csv:"website"`
	Logo          string `csv:"logo"`
}
