create table cabrito.country
(
    country_id               varchar(2) not null
        constraint country_pk
            primary key,
    country_id3              varchar(3) not null
        constraint country_uk1
            unique,
    country_name             varchar    not null,
    country_code             varchar,
    iso_3166_2               varchar,
    region                   varchar,
    sub_region               varchar,
    intermediate_region      varchar,
    region_code              varchar,
    sub_region_code          varchar,
    intermediate_region_code varchar,
    flag_emoji               varchar(8) not null
);

INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Bhutan', 'BT', 'BTN', '064', 'ISO 3166-2:BT', 'Asia', 'Southern Asia', null, '142', '034', null, '🇧🇹');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Bolivia (Plurinational State of)', 'BO', 'BOL', '068', 'ISO 3166-2:BO', 'Americas',
        'Latin America and the Caribbean', 'South America', '019', '419', '005', '🇧🇴');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Bonaire, Sint Eustatius and Saba', 'BQ', 'BES', '535', 'ISO 3166-2:BQ', 'Americas',
        'Latin America and the Caribbean', 'Caribbean', '019', '419', '029', '🇧🇶');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Bosnia and Herzegovina', 'BA', 'BIH', '070', 'ISO 3166-2:BA', 'Europe', 'Southern Europe', null, '150', '039',
        null, '🇧🇦');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Botswana', 'BW', 'BWA', '072', 'ISO 3166-2:BW', 'Africa', 'Sub-Saharan Africa', 'Southern Africa', '002',
        '202', '018', '🇧🇼');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Bouvet Island', 'BV', 'BVT', '074', 'ISO 3166-2:BV', 'Americas', 'Latin America and the Caribbean',
        'South America', '019', '419', '005', '🇧🇻');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Brazil', 'BR', 'BRA', '076', 'ISO 3166-2:BR', 'Americas', 'Latin America and the Caribbean', 'South America',
        '019', '419', '005', '🇧🇷');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('British Indian Ocean Territory', 'IO', 'IOT', '086', 'ISO 3166-2:IO', 'Africa', 'Sub-Saharan Africa',
        'Eastern Africa', '002', '202', '014', '🇮🇴');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Brunei Darussalam', 'BN', 'BRN', '096', 'ISO 3166-2:BN', 'Asia', 'South-eastern Asia', null, '142', '035',
        null, '🇧🇳');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Bulgaria', 'BG', 'BGR', '100', 'ISO 3166-2:BG', 'Europe', 'Eastern Europe', null, '150', '151', null, '🇧🇬');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Burkina Faso', 'BF', 'BFA', '854', 'ISO 3166-2:BF', 'Africa', 'Sub-Saharan Africa', 'Western Africa', '002',
        '202', '011', '🇧🇫');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Burundi', 'BI', 'BDI', '108', 'ISO 3166-2:BI', 'Africa', 'Sub-Saharan Africa', 'Eastern Africa', '002', '202',
        '014', '🇧🇮');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Cabo Verde', 'CV', 'CPV', '132', 'ISO 3166-2:CV', 'Africa', 'Sub-Saharan Africa', 'Western Africa', '002',
        '202', '011', '🇨🇻');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Cambodia', 'KH', 'KHM', '116', 'ISO 3166-2:KH', 'Asia', 'South-eastern Asia', null, '142', '035', null, '🇰🇭');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Cameroon', 'CM', 'CMR', '120', 'ISO 3166-2:CM', 'Africa', 'Sub-Saharan Africa', 'Middle Africa', '002', '202',
        '017', '🇨🇲');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Canada', 'CA', 'CAN', '124', 'ISO 3166-2:CA', 'Americas', 'Northern America', null, '019', '021', null, '🇨🇦');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Cayman Islands', 'KY', 'CYM', '136', 'ISO 3166-2:KY', 'Americas', 'Latin America and the Caribbean',
        'Caribbean', '019', '419', '029', '🇰🇾');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Central African Republic', 'CF', 'CAF', '140', 'ISO 3166-2:CF', 'Africa', 'Sub-Saharan Africa',
        'Middle Africa', '002', '202', '017', '🇨🇫');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Chad', 'TD', 'TCD', '148', 'ISO 3166-2:TD', 'Africa', 'Sub-Saharan Africa', 'Middle Africa', '002', '202',
        '017', '🇹🇩');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Chile', 'CL', 'CHL', '152', 'ISO 3166-2:CL', 'Americas', 'Latin America and the Caribbean', 'South America',
        '019', '419', '005', '🇨🇱');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('China', 'CN', 'CHN', '156', 'ISO 3166-2:CN', 'Asia', 'Eastern Asia', null, '142', '030', null, '🇨🇳');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Christmas Island', 'CX', 'CXR', '162', 'ISO 3166-2:CX', 'Oceania', 'Australia and New Zealand', null, '009',
        '053', null, '🇨🇽');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Cocos (Keeling) Islands', 'CC', 'CCK', '166', 'ISO 3166-2:CC', 'Oceania', 'Australia and New Zealand', null,
        '009', '053', null, '🇨🇨');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Colombia', 'CO', 'COL', '170', 'ISO 3166-2:CO', 'Americas', 'Latin America and the Caribbean', 'South America',
        '019', '419', '005', '🇨🇴');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Comoros', 'KM', 'COM', '174', 'ISO 3166-2:KM', 'Africa', 'Sub-Saharan Africa', 'Eastern Africa', '002', '202',
        '014', '🇰🇲');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Congo', 'CG', 'COG', '178', 'ISO 3166-2:CG', 'Africa', 'Sub-Saharan Africa', 'Middle Africa', '002', '202',
        '017', '🇨🇬');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Congo, Democratic Republic of the', 'CD', 'COD', '180', 'ISO 3166-2:CD', 'Africa', 'Sub-Saharan Africa',
        'Middle Africa', '002', '202', '017', '🇨🇩');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Cook Islands', 'CK', 'COK', '184', 'ISO 3166-2:CK', 'Oceania', 'Polynesia', null, '009', '061', null, '🇨🇰');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Costa Rica', 'CR', 'CRI', '188', 'ISO 3166-2:CR', 'Americas', 'Latin America and the Caribbean',
        'Central America', '019', '419', '013', '🇨🇷');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Côte d''Ivoire', 'CI', 'CIV', '384', 'ISO 3166-2:CI', 'Africa', 'Sub-Saharan Africa', 'Western Africa', '002',
        '202', '011', '🇨🇮');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Croatia', 'HR', 'HRV', '191', 'ISO 3166-2:HR', 'Europe', 'Southern Europe', null, '150', '039', null, '🇭🇷');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Cuba', 'CU', 'CUB', '192', 'ISO 3166-2:CU', 'Americas', 'Latin America and the Caribbean', 'Caribbean', '019',
        '419', '029', '🇨🇺');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Curaçao', 'CW', 'CUW', '531', 'ISO 3166-2:CW', 'Americas', 'Latin America and the Caribbean', 'Caribbean',
        '019', '419', '029', '🇨🇼');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Cyprus', 'CY', 'CYP', '196', 'ISO 3166-2:CY', 'Asia', 'Western Asia', null, '142', '145', null, '🇨🇾');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Czechia', 'CZ', 'CZE', '203', 'ISO 3166-2:CZ', 'Europe', 'Eastern Europe', null, '150', '151', null, '🇨🇿');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Denmark', 'DK', 'DNK', '208', 'ISO 3166-2:DK', 'Europe', 'Northern Europe', null, '150', '154', null, '🇩🇰');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Djibouti', 'DJ', 'DJI', '262', 'ISO 3166-2:DJ', 'Africa', 'Sub-Saharan Africa', 'Eastern Africa', '002', '202',
        '014', '🇩🇯');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Dominica', 'DM', 'DMA', '212', 'ISO 3166-2:DM', 'Americas', 'Latin America and the Caribbean', 'Caribbean',
        '019', '419', '029', '🇩🇲');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Dominican Republic', 'DO', 'DOM', '214', 'ISO 3166-2:DO', 'Americas', 'Latin America and the Caribbean',
        'Caribbean', '019', '419', '029', '🇩🇴');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Ecuador', 'EC', 'ECU', '218', 'ISO 3166-2:EC', 'Americas', 'Latin America and the Caribbean', 'South America',
        '019', '419', '005', '🇪🇨');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Egypt', 'EG', 'EGY', '818', 'ISO 3166-2:EG', 'Africa', 'Northern Africa', null, '002', '015', null, '🇪🇬');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('El Salvador', 'SV', 'SLV', '222', 'ISO 3166-2:SV', 'Americas', 'Latin America and the Caribbean',
        'Central America', '019', '419', '013', '🇸🇻');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Equatorial Guinea', 'GQ', 'GNQ', '226', 'ISO 3166-2:GQ', 'Africa', 'Sub-Saharan Africa', 'Middle Africa',
        '002', '202', '017', '🇬🇶');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Eritrea', 'ER', 'ERI', '232', 'ISO 3166-2:ER', 'Africa', 'Sub-Saharan Africa', 'Eastern Africa', '002', '202',
        '014', '🇪🇷');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Estonia', 'EE', 'EST', '233', 'ISO 3166-2:EE', 'Europe', 'Northern Europe', null, '150', '154', null, '🇪🇪');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Eswatini', 'SZ', 'SWZ', '748', 'ISO 3166-2:SZ', 'Africa', 'Sub-Saharan Africa', 'Southern Africa', '002',
        '202', '018', '🇸🇿');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Ethiopia', 'ET', 'ETH', '231', 'ISO 3166-2:ET', 'Africa', 'Sub-Saharan Africa', 'Eastern Africa', '002', '202',
        '014', '🇪🇹');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Falkland Islands (Malvinas)', 'FK', 'FLK', '238', 'ISO 3166-2:FK', 'Americas',
        'Latin America and the Caribbean', 'South America', '019', '419', '005', '🇫🇰');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Faroe Islands', 'FO', 'FRO', '234', 'ISO 3166-2:FO', 'Europe', 'Northern Europe', null, '150', '154', null,
        '🇫🇴');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Fiji', 'FJ', 'FJI', '242', 'ISO 3166-2:FJ', 'Oceania', 'Melanesia', null, '009', '054', null, '🇫🇯');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Finland', 'FI', 'FIN', '246', 'ISO 3166-2:FI', 'Europe', 'Northern Europe', null, '150', '154', null, '🇫🇮');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('France', 'FR', 'FRA', '250', 'ISO 3166-2:FR', 'Europe', 'Western Europe', null, '150', '155', null, '🇫🇷');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('French Guiana', 'GF', 'GUF', '254', 'ISO 3166-2:GF', 'Americas', 'Latin America and the Caribbean',
        'South America', '019', '419', '005', '🇬🇫');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('French Polynesia', 'PF', 'PYF', '258', 'ISO 3166-2:PF', 'Oceania', 'Polynesia', null, '009', '061', null,
        '🇵🇫');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('French Southern Territories', 'TF', 'ATF', '260', 'ISO 3166-2:TF', 'Africa', 'Sub-Saharan Africa',
        'Eastern Africa', '002', '202', '014', '🇹🇫');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Gabon', 'GA', 'GAB', '266', 'ISO 3166-2:GA', 'Africa', 'Sub-Saharan Africa', 'Middle Africa', '002', '202',
        '017', '🇬🇦');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Gambia', 'GM', 'GMB', '270', 'ISO 3166-2:GM', 'Africa', 'Sub-Saharan Africa', 'Western Africa', '002', '202',
        '011', '🇬🇲');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Georgia', 'GE', 'GEO', '268', 'ISO 3166-2:GE', 'Asia', 'Western Asia', null, '142', '145', null, '🇬🇪');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Germany', 'DE', 'DEU', '276', 'ISO 3166-2:DE', 'Europe', 'Western Europe', null, '150', '155', null, '🇩🇪');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Ghana', 'GH', 'GHA', '288', 'ISO 3166-2:GH', 'Africa', 'Sub-Saharan Africa', 'Western Africa', '002', '202',
        '011', '🇬🇭');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Gibraltar', 'GI', 'GIB', '292', 'ISO 3166-2:GI', 'Europe', 'Southern Europe', null, '150', '039', null, '🇬🇮');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Greece', 'GR', 'GRC', '300', 'ISO 3166-2:GR', 'Europe', 'Southern Europe', null, '150', '039', null, '🇬🇷');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Greenland', 'GL', 'GRL', '304', 'ISO 3166-2:GL', 'Americas', 'Northern America', null, '019', '021', null,
        '🇬🇱');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Grenada', 'GD', 'GRD', '308', 'ISO 3166-2:GD', 'Americas', 'Latin America and the Caribbean', 'Caribbean',
        '019', '419', '029', '🇬🇩');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Guadeloupe', 'GP', 'GLP', '312', 'ISO 3166-2:GP', 'Americas', 'Latin America and the Caribbean', 'Caribbean',
        '019', '419', '029', '🇬🇵');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Guam', 'GU', 'GUM', '316', 'ISO 3166-2:GU', 'Oceania', 'Micronesia', null, '009', '057', null, '🇬🇺');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Guatemala', 'GT', 'GTM', '320', 'ISO 3166-2:GT', 'Americas', 'Latin America and the Caribbean',
        'Central America', '019', '419', '013', '🇬🇹');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Guernsey', 'GG', 'GGY', '831', 'ISO 3166-2:GG', 'Europe', 'Northern Europe', 'Channel Islands', '150', '154',
        '830', '🇬🇬');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Guinea', 'GN', 'GIN', '324', 'ISO 3166-2:GN', 'Africa', 'Sub-Saharan Africa', 'Western Africa', '002', '202',
        '011', '🇬🇳');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Guinea-Bissau', 'GW', 'GNB', '624', 'ISO 3166-2:GW', 'Africa', 'Sub-Saharan Africa', 'Western Africa', '002',
        '202', '011', '🇬🇼');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Guyana', 'GY', 'GUY', '328', 'ISO 3166-2:GY', 'Americas', 'Latin America and the Caribbean', 'South America',
        '019', '419', '005', '🇬🇾');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Haiti', 'HT', 'HTI', '332', 'ISO 3166-2:HT', 'Americas', 'Latin America and the Caribbean', 'Caribbean', '019',
        '419', '029', '🇭🇹');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Heard Island and McDonald Islands', 'HM', 'HMD', '334', 'ISO 3166-2:HM', 'Oceania',
        'Australia and New Zealand', null, '009', '053', null, '🇭🇲');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Holy See', 'VA', 'VAT', '336', 'ISO 3166-2:VA', 'Europe', 'Southern Europe', null, '150', '039', null, '🇻🇦');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Honduras', 'HN', 'HND', '340', 'ISO 3166-2:HN', 'Americas', 'Latin America and the Caribbean',
        'Central America', '019', '419', '013', '🇭🇳');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Hong Kong', 'HK', 'HKG', '344', 'ISO 3166-2:HK', 'Asia', 'Eastern Asia', null, '142', '030', null, '🇭🇰');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Hungary', 'HU', 'HUN', '348', 'ISO 3166-2:HU', 'Europe', 'Eastern Europe', null, '150', '151', null, '🇭🇺');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Iceland', 'IS', 'ISL', '352', 'ISO 3166-2:IS', 'Europe', 'Northern Europe', null, '150', '154', null, '🇮🇸');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('India', 'IN', 'IND', '356', 'ISO 3166-2:IN', 'Asia', 'Southern Asia', null, '142', '034', null, '🇮🇳');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Indonesia', 'ID', 'IDN', '360', 'ISO 3166-2:ID', 'Asia', 'South-eastern Asia', null, '142', '035', null, '🇮🇩');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Iran (Islamic Republic of)', 'IR', 'IRN', '364', 'ISO 3166-2:IR', 'Asia', 'Southern Asia', null, '142', '034',
        null, '🇮🇷');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Iraq', 'IQ', 'IRQ', '368', 'ISO 3166-2:IQ', 'Asia', 'Western Asia', null, '142', '145', null, '🇮🇶');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Ireland', 'IE', 'IRL', '372', 'ISO 3166-2:IE', 'Europe', 'Northern Europe', null, '150', '154', null, '🇮🇪');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Isle of Man', 'IM', 'IMN', '833', 'ISO 3166-2:IM', 'Europe', 'Northern Europe', null, '150', '154', null,
        '🇮🇲');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Israel', 'IL', 'ISR', '376', 'ISO 3166-2:IL', 'Asia', 'Western Asia', null, '142', '145', null, '🇮🇱');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Italy', 'IT', 'ITA', '380', 'ISO 3166-2:IT', 'Europe', 'Southern Europe', null, '150', '039', null, '🇮🇹');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Jamaica', 'JM', 'JAM', '388', 'ISO 3166-2:JM', 'Americas', 'Latin America and the Caribbean', 'Caribbean',
        '019', '419', '029', '🇯🇲');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Japan', 'JP', 'JPN', '392', 'ISO 3166-2:JP', 'Asia', 'Eastern Asia', null, '142', '030', null, '🇯🇵');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Jersey', 'JE', 'JEY', '832', 'ISO 3166-2:JE', 'Europe', 'Northern Europe', 'Channel Islands', '150', '154',
        '830', '🇯🇪');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Jordan', 'JO', 'JOR', '400', 'ISO 3166-2:JO', 'Asia', 'Western Asia', null, '142', '145', null, '🇯🇴');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Kazakhstan', 'KZ', 'KAZ', '398', 'ISO 3166-2:KZ', 'Asia', 'Central Asia', null, '142', '143', null, '🇰🇿');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Kenya', 'KE', 'KEN', '404', 'ISO 3166-2:KE', 'Africa', 'Sub-Saharan Africa', 'Eastern Africa', '002', '202',
        '014', '🇰🇪');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Kiribati', 'KI', 'KIR', '296', 'ISO 3166-2:KI', 'Oceania', 'Micronesia', null, '009', '057', null, '🇰🇮');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Korea (Democratic People''s Republic of)', 'KP', 'PRK', '408', 'ISO 3166-2:KP', 'Asia', 'Eastern Asia', null,
        '142', '030', null, '🇰🇵');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Korea, Republic of', 'KR', 'KOR', '410', 'ISO 3166-2:KR', 'Asia', 'Eastern Asia', null, '142', '030', null,
        '🇰🇷');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Kuwait', 'KW', 'KWT', '414', 'ISO 3166-2:KW', 'Asia', 'Western Asia', null, '142', '145', null, '🇰🇼');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Kyrgyzstan', 'KG', 'KGZ', '417', 'ISO 3166-2:KG', 'Asia', 'Central Asia', null, '142', '143', null, '🇰🇬');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Lao People''s Democratic Republic', 'LA', 'LAO', '418', 'ISO 3166-2:LA', 'Asia', 'South-eastern Asia', null,
        '142', '035', null, '🇱🇦');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Latvia', 'LV', 'LVA', '428', 'ISO 3166-2:LV', 'Europe', 'Northern Europe', null, '150', '154', null, '🇱🇻');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Lebanon', 'LB', 'LBN', '422', 'ISO 3166-2:LB', 'Asia', 'Western Asia', null, '142', '145', null, '🇱🇧');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Lesotho', 'LS', 'LSO', '426', 'ISO 3166-2:LS', 'Africa', 'Sub-Saharan Africa', 'Southern Africa', '002', '202',
        '018', '🇱🇸');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Liberia', 'LR', 'LBR', '430', 'ISO 3166-2:LR', 'Africa', 'Sub-Saharan Africa', 'Western Africa', '002', '202',
        '011', '🇱🇷');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Libya', 'LY', 'LBY', '434', 'ISO 3166-2:LY', 'Africa', 'Northern Africa', null, '002', '015', null, '🇱🇾');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Liechtenstein', 'LI', 'LIE', '438', 'ISO 3166-2:LI', 'Europe', 'Western Europe', null, '150', '155', null,
        '🇱🇮');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Lithuania', 'LT', 'LTU', '440', 'ISO 3166-2:LT', 'Europe', 'Northern Europe', null, '150', '154', null, '🇱🇹');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Luxembourg', 'LU', 'LUX', '442', 'ISO 3166-2:LU', 'Europe', 'Western Europe', null, '150', '155', null, '🇱🇺');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Macao', 'MO', 'MAC', '446', 'ISO 3166-2:MO', 'Asia', 'Eastern Asia', null, '142', '030', null, '🇲🇴');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Madagascar', 'MG', 'MDG', '450', 'ISO 3166-2:MG', 'Africa', 'Sub-Saharan Africa', 'Eastern Africa', '002',
        '202', '014', '🇲🇬');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Malawi', 'MW', 'MWI', '454', 'ISO 3166-2:MW', 'Africa', 'Sub-Saharan Africa', 'Eastern Africa', '002', '202',
        '014', '🇲🇼');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Malaysia', 'MY', 'MYS', '458', 'ISO 3166-2:MY', 'Asia', 'South-eastern Asia', null, '142', '035', null, '🇲🇾');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Maldives', 'MV', 'MDV', '462', 'ISO 3166-2:MV', 'Asia', 'Southern Asia', null, '142', '034', null, '🇲🇻');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Mali', 'ML', 'MLI', '466', 'ISO 3166-2:ML', 'Africa', 'Sub-Saharan Africa', 'Western Africa', '002', '202',
        '011', '🇲🇱');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Malta', 'MT', 'MLT', '470', 'ISO 3166-2:MT', 'Europe', 'Southern Europe', null, '150', '039', null, '🇲🇹');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Marshall Islands', 'MH', 'MHL', '584', 'ISO 3166-2:MH', 'Oceania', 'Micronesia', null, '009', '057', null,
        '🇲🇭');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Martinique', 'MQ', 'MTQ', '474', 'ISO 3166-2:MQ', 'Americas', 'Latin America and the Caribbean', 'Caribbean',
        '019', '419', '029', '🇲🇶');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Mauritania', 'MR', 'MRT', '478', 'ISO 3166-2:MR', 'Africa', 'Sub-Saharan Africa', 'Western Africa', '002',
        '202', '011', '🇲🇷');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Mauritius', 'MU', 'MUS', '480', 'ISO 3166-2:MU', 'Africa', 'Sub-Saharan Africa', 'Eastern Africa', '002',
        '202', '014', '🇲🇺');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Mayotte', 'YT', 'MYT', '175', 'ISO 3166-2:YT', 'Africa', 'Sub-Saharan Africa', 'Eastern Africa', '002', '202',
        '014', '🇾🇹');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Mexico', 'MX', 'MEX', '484', 'ISO 3166-2:MX', 'Americas', 'Latin America and the Caribbean', 'Central America',
        '019', '419', '013', '🇲🇽');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Micronesia (Federated States of)', 'FM', 'FSM', '583', 'ISO 3166-2:FM', 'Oceania', 'Micronesia', null, '009',
        '057', null, '🇫🇲');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Moldova, Republic of', 'MD', 'MDA', '498', 'ISO 3166-2:MD', 'Europe', 'Eastern Europe', null, '150', '151',
        null, '🇲🇩');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Monaco', 'MC', 'MCO', '492', 'ISO 3166-2:MC', 'Europe', 'Western Europe', null, '150', '155', null, '🇲🇨');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Mongolia', 'MN', 'MNG', '496', 'ISO 3166-2:MN', 'Asia', 'Eastern Asia', null, '142', '030', null, '🇲🇳');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Montenegro', 'ME', 'MNE', '499', 'ISO 3166-2:ME', 'Europe', 'Southern Europe', null, '150', '039', null, '🇲🇪');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Montserrat', 'MS', 'MSR', '500', 'ISO 3166-2:MS', 'Americas', 'Latin America and the Caribbean', 'Caribbean',
        '019', '419', '029', '🇲🇸');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Morocco', 'MA', 'MAR', '504', 'ISO 3166-2:MA', 'Africa', 'Northern Africa', null, '002', '015', null, '🇲🇦');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Mozambique', 'MZ', 'MOZ', '508', 'ISO 3166-2:MZ', 'Africa', 'Sub-Saharan Africa', 'Eastern Africa', '002',
        '202', '014', '🇲🇿');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Myanmar', 'MM', 'MMR', '104', 'ISO 3166-2:MM', 'Asia', 'South-eastern Asia', null, '142', '035', null, '🇲🇲');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Namibia', 'NA', 'NAM', '516', 'ISO 3166-2:NA', 'Africa', 'Sub-Saharan Africa', 'Southern Africa', '002', '202',
        '018', '🇳🇦');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Nauru', 'NR', 'NRU', '520', 'ISO 3166-2:NR', 'Oceania', 'Micronesia', null, '009', '057', null, '🇳🇷');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Nepal', 'NP', 'NPL', '524', 'ISO 3166-2:NP', 'Asia', 'Southern Asia', null, '142', '034', null, '🇳🇵');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Netherlands', 'NL', 'NLD', '528', 'ISO 3166-2:NL', 'Europe', 'Western Europe', null, '150', '155', null, '🇳🇱');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('New Caledonia', 'NC', 'NCL', '540', 'ISO 3166-2:NC', 'Oceania', 'Melanesia', null, '009', '054', null, '🇳🇨');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('New Zealand', 'NZ', 'NZL', '554', 'ISO 3166-2:NZ', 'Oceania', 'Australia and New Zealand', null, '009', '053',
        null, '🇳🇿');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Nicaragua', 'NI', 'NIC', '558', 'ISO 3166-2:NI', 'Americas', 'Latin America and the Caribbean',
        'Central America', '019', '419', '013', '🇳🇮');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Niger', 'NE', 'NER', '562', 'ISO 3166-2:NE', 'Africa', 'Sub-Saharan Africa', 'Western Africa', '002', '202',
        '011', '🇳🇪');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Nigeria', 'NG', 'NGA', '566', 'ISO 3166-2:NG', 'Africa', 'Sub-Saharan Africa', 'Western Africa', '002', '202',
        '011', '🇳🇬');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Niue', 'NU', 'NIU', '570', 'ISO 3166-2:NU', 'Oceania', 'Polynesia', null, '009', '061', null, '🇳🇺');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Norfolk Island', 'NF', 'NFK', '574', 'ISO 3166-2:NF', 'Oceania', 'Australia and New Zealand', null, '009',
        '053', null, '🇳🇫');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('North Macedonia', 'MK', 'MKD', '807', 'ISO 3166-2:MK', 'Europe', 'Southern Europe', null, '150', '039', null,
        '🇲🇰');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Northern Mariana Islands', 'MP', 'MNP', '580', 'ISO 3166-2:MP', 'Oceania', 'Micronesia', null, '009', '057',
        null, '🇲🇵');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Norway', 'NO', 'NOR', '578', 'ISO 3166-2:NO', 'Europe', 'Northern Europe', null, '150', '154', null, '🇳🇴');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Oman', 'OM', 'OMN', '512', 'ISO 3166-2:OM', 'Asia', 'Western Asia', null, '142', '145', null, '🇴🇲');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Pakistan', 'PK', 'PAK', '586', 'ISO 3166-2:PK', 'Asia', 'Southern Asia', null, '142', '034', null, '🇵🇰');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Palau', 'PW', 'PLW', '585', 'ISO 3166-2:PW', 'Oceania', 'Micronesia', null, '009', '057', null, '🇵🇼');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Palestine, State of', 'PS', 'PSE', '275', 'ISO 3166-2:PS', 'Asia', 'Western Asia', null, '142', '145', null,
        '🇵🇸');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Panama', 'PA', 'PAN', '591', 'ISO 3166-2:PA', 'Americas', 'Latin America and the Caribbean', 'Central America',
        '019', '419', '013', '🇵🇦');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Papua New Guinea', 'PG', 'PNG', '598', 'ISO 3166-2:PG', 'Oceania', 'Melanesia', null, '009', '054', null,
        '🇵🇬');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Paraguay', 'PY', 'PRY', '600', 'ISO 3166-2:PY', 'Americas', 'Latin America and the Caribbean', 'South America',
        '019', '419', '005', '🇵🇾');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Peru', 'PE', 'PER', '604', 'ISO 3166-2:PE', 'Americas', 'Latin America and the Caribbean', 'South America',
        '019', '419', '005', '🇵🇪');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Philippines', 'PH', 'PHL', '608', 'ISO 3166-2:PH', 'Asia', 'South-eastern Asia', null, '142', '035', null,
        '🇵🇭');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Pitcairn', 'PN', 'PCN', '612', 'ISO 3166-2:PN', 'Oceania', 'Polynesia', null, '009', '061', null, '🇵🇳');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Poland', 'PL', 'POL', '616', 'ISO 3166-2:PL', 'Europe', 'Eastern Europe', null, '150', '151', null, '🇵🇱');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Portugal', 'PT', 'PRT', '620', 'ISO 3166-2:PT', 'Europe', 'Southern Europe', null, '150', '039', null, '🇵🇹');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Puerto Rico', 'PR', 'PRI', '630', 'ISO 3166-2:PR', 'Americas', 'Latin America and the Caribbean', 'Caribbean',
        '019', '419', '029', '🇵🇷');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Qatar', 'QA', 'QAT', '634', 'ISO 3166-2:QA', 'Asia', 'Western Asia', null, '142', '145', null, '🇶🇦');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Réunion', 'RE', 'REU', '638', 'ISO 3166-2:RE', 'Africa', 'Sub-Saharan Africa', 'Eastern Africa', '002', '202',
        '014', '🇷🇪');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Romania', 'RO', 'ROU', '642', 'ISO 3166-2:RO', 'Europe', 'Eastern Europe', null, '150', '151', null, '🇷🇴');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Russian Federation', 'RU', 'RUS', '643', 'ISO 3166-2:RU', 'Europe', 'Eastern Europe', null, '150', '151', null,
        '🇷🇺');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Rwanda', 'RW', 'RWA', '646', 'ISO 3166-2:RW', 'Africa', 'Sub-Saharan Africa', 'Eastern Africa', '002', '202',
        '014', '🇷🇼');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Saint Barthélemy', 'BL', 'BLM', '652', 'ISO 3166-2:BL', 'Americas', 'Latin America and the Caribbean',
        'Caribbean', '019', '419', '029', '🇧🇱');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Saint Helena, Ascension and Tristan da Cunha', 'SH', 'SHN', '654', 'ISO 3166-2:SH', 'Africa',
        'Sub-Saharan Africa', 'Western Africa', '002', '202', '011', '🇸🇭');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Saint Kitts and Nevis', 'KN', 'KNA', '659', 'ISO 3166-2:KN', 'Americas', 'Latin America and the Caribbean',
        'Caribbean', '019', '419', '029', '🇰🇳');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Saint Lucia', 'LC', 'LCA', '662', 'ISO 3166-2:LC', 'Americas', 'Latin America and the Caribbean', 'Caribbean',
        '019', '419', '029', '🇱🇨');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Saint Martin (French part)', 'MF', 'MAF', '663', 'ISO 3166-2:MF', 'Americas',
        'Latin America and the Caribbean', 'Caribbean', '019', '419', '029', '🇲🇫');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Saint Pierre and Miquelon', 'PM', 'SPM', '666', 'ISO 3166-2:PM', 'Americas', 'Northern America', null, '019',
        '021', null, '🇵🇲');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Saint Vincent and the Grenadines', 'VC', 'VCT', '670', 'ISO 3166-2:VC', 'Americas',
        'Latin America and the Caribbean', 'Caribbean', '019', '419', '029', '🇻🇨');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Samoa', 'WS', 'WSM', '882', 'ISO 3166-2:WS', 'Oceania', 'Polynesia', null, '009', '061', null, '🇼🇸');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('San Marino', 'SM', 'SMR', '674', 'ISO 3166-2:SM', 'Europe', 'Southern Europe', null, '150', '039', null, '🇸🇲');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Sao Tome and Principe', 'ST', 'STP', '678', 'ISO 3166-2:ST', 'Africa', 'Sub-Saharan Africa', 'Middle Africa',
        '002', '202', '017', '🇸🇹');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Saudi Arabia', 'SA', 'SAU', '682', 'ISO 3166-2:SA', 'Asia', 'Western Asia', null, '142', '145', null, '🇸🇦');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Senegal', 'SN', 'SEN', '686', 'ISO 3166-2:SN', 'Africa', 'Sub-Saharan Africa', 'Western Africa', '002', '202',
        '011', '🇸🇳');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Serbia', 'RS', 'SRB', '688', 'ISO 3166-2:RS', 'Europe', 'Southern Europe', null, '150', '039', null, '🇷🇸');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Seychelles', 'SC', 'SYC', '690', 'ISO 3166-2:SC', 'Africa', 'Sub-Saharan Africa', 'Eastern Africa', '002',
        '202', '014', '🇸🇨');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Sierra Leone', 'SL', 'SLE', '694', 'ISO 3166-2:SL', 'Africa', 'Sub-Saharan Africa', 'Western Africa', '002',
        '202', '011', '🇸🇱');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Singapore', 'SG', 'SGP', '702', 'ISO 3166-2:SG', 'Asia', 'South-eastern Asia', null, '142', '035', null, '🇸🇬');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Sint Maarten (Dutch part)', 'SX', 'SXM', '534', 'ISO 3166-2:SX', 'Americas', 'Latin America and the Caribbean',
        'Caribbean', '019', '419', '029', '🇸🇽');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Slovakia', 'SK', 'SVK', '703', 'ISO 3166-2:SK', 'Europe', 'Eastern Europe', null, '150', '151', null, '🇸🇰');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Slovenia', 'SI', 'SVN', '705', 'ISO 3166-2:SI', 'Europe', 'Southern Europe', null, '150', '039', null, '🇸🇮');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Solomon Islands', 'SB', 'SLB', '090', 'ISO 3166-2:SB', 'Oceania', 'Melanesia', null, '009', '054', null, '🇸🇧');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Somalia', 'SO', 'SOM', '706', 'ISO 3166-2:SO', 'Africa', 'Sub-Saharan Africa', 'Eastern Africa', '002', '202',
        '014', '🇸🇴');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('South Africa', 'ZA', 'ZAF', '710', 'ISO 3166-2:ZA', 'Africa', 'Sub-Saharan Africa', 'Southern Africa', '002',
        '202', '018', '🇿🇦');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('South Georgia and the South Sandwich Islands', 'GS', 'SGS', '239', 'ISO 3166-2:GS', 'Americas',
        'Latin America and the Caribbean', 'South America', '019', '419', '005', '🇬🇸');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('South Sudan', 'SS', 'SSD', '728', 'ISO 3166-2:SS', 'Africa', 'Sub-Saharan Africa', 'Eastern Africa', '002',
        '202', '014', '🇸🇸');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Spain', 'ES', 'ESP', '724', 'ISO 3166-2:ES', 'Europe', 'Southern Europe', null, '150', '039', null, '🇪🇸');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Sri Lanka', 'LK', 'LKA', '144', 'ISO 3166-2:LK', 'Asia', 'Southern Asia', null, '142', '034', null, '🇱🇰');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Sudan', 'SD', 'SDN', '729', 'ISO 3166-2:SD', 'Africa', 'Northern Africa', null, '002', '015', null, '🇸🇩');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Suriname', 'SR', 'SUR', '740', 'ISO 3166-2:SR', 'Americas', 'Latin America and the Caribbean', 'South America',
        '019', '419', '005', '🇸🇷');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Svalbard and Jan Mayen', 'SJ', 'SJM', '744', 'ISO 3166-2:SJ', 'Europe', 'Northern Europe', null, '150', '154',
        null, '🇸🇯');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Sweden', 'SE', 'SWE', '752', 'ISO 3166-2:SE', 'Europe', 'Northern Europe', null, '150', '154', null, '🇸🇪');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Switzerland', 'CH', 'CHE', '756', 'ISO 3166-2:CH', 'Europe', 'Western Europe', null, '150', '155', null, '🇨🇭');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Syrian Arab Republic', 'SY', 'SYR', '760', 'ISO 3166-2:SY', 'Asia', 'Western Asia', null, '142', '145', null,
        '🇸🇾');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Taiwan, Province of China', 'TW', 'TWN', '158', 'ISO 3166-2:TW', 'Asia', 'Eastern Asia', null, '142', '030',
        null, '🇹🇼');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Tajikistan', 'TJ', 'TJK', '762', 'ISO 3166-2:TJ', 'Asia', 'Central Asia', null, '142', '143', null, '🇹🇯');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Tanzania, United Republic of', 'TZ', 'TZA', '834', 'ISO 3166-2:TZ', 'Africa', 'Sub-Saharan Africa',
        'Eastern Africa', '002', '202', '014', '🇹🇿');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Thailand', 'TH', 'THA', '764', 'ISO 3166-2:TH', 'Asia', 'South-eastern Asia', null, '142', '035', null, '🇹🇭');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Timor-Leste', 'TL', 'TLS', '626', 'ISO 3166-2:TL', 'Asia', 'South-eastern Asia', null, '142', '035', null,
        '🇹🇱');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Togo', 'TG', 'TGO', '768', 'ISO 3166-2:TG', 'Africa', 'Sub-Saharan Africa', 'Western Africa', '002', '202',
        '011', '🇹🇬');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Tokelau', 'TK', 'TKL', '772', 'ISO 3166-2:TK', 'Oceania', 'Polynesia', null, '009', '061', null, '🇹🇰');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Tonga', 'TO', 'TON', '776', 'ISO 3166-2:TO', 'Oceania', 'Polynesia', null, '009', '061', null, '🇹🇴');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Trinidad and Tobago', 'TT', 'TTO', '780', 'ISO 3166-2:TT', 'Americas', 'Latin America and the Caribbean',
        'Caribbean', '019', '419', '029', '🇹🇹');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Tunisia', 'TN', 'TUN', '788', 'ISO 3166-2:TN', 'Africa', 'Northern Africa', null, '002', '015', null, '🇹🇳');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Turkey', 'TR', 'TUR', '792', 'ISO 3166-2:TR', 'Asia', 'Western Asia', null, '142', '145', null, '🇹🇷');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Turkmenistan', 'TM', 'TKM', '795', 'ISO 3166-2:TM', 'Asia', 'Central Asia', null, '142', '143', null, '🇹🇲');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Turks and Caicos Islands', 'TC', 'TCA', '796', 'ISO 3166-2:TC', 'Americas', 'Latin America and the Caribbean',
        'Caribbean', '019', '419', '029', '🇹🇨');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Tuvalu', 'TV', 'TUV', '798', 'ISO 3166-2:TV', 'Oceania', 'Polynesia', null, '009', '061', null, '🇹🇻');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Uganda', 'UG', 'UGA', '800', 'ISO 3166-2:UG', 'Africa', 'Sub-Saharan Africa', 'Eastern Africa', '002', '202',
        '014', '🇺🇬');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Ukraine', 'UA', 'UKR', '804', 'ISO 3166-2:UA', 'Europe', 'Eastern Europe', null, '150', '151', null, '🇺🇦');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('United Arab Emirates', 'AE', 'ARE', '784', 'ISO 3166-2:AE', 'Asia', 'Western Asia', null, '142', '145', null,
        '🇦🇪');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('United Kingdom of Great Britain and Northern Ireland', 'GB', 'GBR', '826', 'ISO 3166-2:GB', 'Europe',
        'Northern Europe', null, '150', '154', null, '🇬🇧');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('United States of America', 'US', 'USA', '840', 'ISO 3166-2:US', 'Americas', 'Northern America', null, '019',
        '021', null, '🇺🇸');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('United States Minor Outlying Islands', 'UM', 'UMI', '581', 'ISO 3166-2:UM', 'Oceania', 'Micronesia', null,
        '009', '057', null, '🇺🇲');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Uruguay', 'UY', 'URY', '858', 'ISO 3166-2:UY', 'Americas', 'Latin America and the Caribbean', 'South America',
        '019', '419', '005', '🇺🇾');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Uzbekistan', 'UZ', 'UZB', '860', 'ISO 3166-2:UZ', 'Asia', 'Central Asia', null, '142', '143', null, '🇺🇿');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Vanuatu', 'VU', 'VUT', '548', 'ISO 3166-2:VU', 'Oceania', 'Melanesia', null, '009', '054', null, '🇻🇺');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Venezuela (Bolivarian Republic of)', 'VE', 'VEN', '862', 'ISO 3166-2:VE', 'Americas',
        'Latin America and the Caribbean', 'South America', '019', '419', '005', '🇻🇪');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Viet Nam', 'VN', 'VNM', '704', 'ISO 3166-2:VN', 'Asia', 'South-eastern Asia', null, '142', '035', null, '🇻🇳');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Virgin Islands (British)', 'VG', 'VGB', '092', 'ISO 3166-2:VG', 'Americas', 'Latin America and the Caribbean',
        'Caribbean', '019', '419', '029', '🇻🇬');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Virgin Islands (U.S.)', 'VI', 'VIR', '850', 'ISO 3166-2:VI', 'Americas', 'Latin America and the Caribbean',
        'Caribbean', '019', '419', '029', '🇻🇮');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Wallis and Futuna', 'WF', 'WLF', '876', 'ISO 3166-2:WF', 'Oceania', 'Polynesia', null, '009', '061', null,
        '🇼🇫');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Western Sahara', 'EH', 'ESH', '732', 'ISO 3166-2:EH', 'Africa', 'Northern Africa', null, '002', '015', null,
        '🇪🇭');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Yemen', 'YE', 'YEM', '887', 'ISO 3166-2:YE', 'Asia', 'Western Asia', null, '142', '145', null, '🇾🇪');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Zambia', 'ZM', 'ZMB', '894', 'ISO 3166-2:ZM', 'Africa', 'Sub-Saharan Africa', 'Eastern Africa', '002', '202',
        '014', '🇿🇲');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Zimbabwe', 'ZW', 'ZWE', '716', 'ISO 3166-2:ZW', 'Africa', 'Sub-Saharan Africa', 'Eastern Africa', '002', '202',
        '014', '🇿🇼');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Afghanistan', 'AF', 'AFG', '004', 'ISO 3166-2:AF', 'Asia', 'Southern Asia', null, '142', '034', null, '🇦🇫');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Åland Islands', 'AX', 'ALA', '248', 'ISO 3166-2:AX', 'Europe', 'Northern Europe', null, '150', '154', null,
        '🇦🇽');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Albania', 'AL', 'ALB', '008', 'ISO 3166-2:AL', 'Europe', 'Southern Europe', null, '150', '039', null, '🇦🇱');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Algeria', 'DZ', 'DZA', '012', 'ISO 3166-2:DZ', 'Africa', 'Northern Africa', null, '002', '015', null, '🇩🇿');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('American Samoa', 'AS', 'ASM', '016', 'ISO 3166-2:AS', 'Oceania', 'Polynesia', null, '009', '061', null, '🇦🇸');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Andorra', 'AD', 'AND', '020', 'ISO 3166-2:AD', 'Europe', 'Southern Europe', null, '150', '039', null, '🇦🇩');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Angola', 'AO', 'AGO', '024', 'ISO 3166-2:AO', 'Africa', 'Sub-Saharan Africa', 'Middle Africa', '002', '202',
        '017', '🇦🇴');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Anguilla', 'AI', 'AIA', '660', 'ISO 3166-2:AI', 'Americas', 'Latin America and the Caribbean', 'Caribbean',
        '019', '419', '029', '🇦🇮');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Antarctica', 'AQ', 'ATA', '010', 'ISO 3166-2:AQ', null, null, null, null, null, null, '🇦🇶');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Antigua and Barbuda', 'AG', 'ATG', '028', 'ISO 3166-2:AG', 'Americas', 'Latin America and the Caribbean',
        'Caribbean', '019', '419', '029', '🇦🇬');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Argentina', 'AR', 'ARG', '032', 'ISO 3166-2:AR', 'Americas', 'Latin America and the Caribbean',
        'South America', '019', '419', '005', '🇦🇷');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Armenia', 'AM', 'ARM', '051', 'ISO 3166-2:AM', 'Asia', 'Western Asia', null, '142', '145', null, '🇦🇲');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Aruba', 'AW', 'ABW', '533', 'ISO 3166-2:AW', 'Americas', 'Latin America and the Caribbean', 'Caribbean', '019',
        '419', '029', '🇦🇼');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Australia', 'AU', 'AUS', '036', 'ISO 3166-2:AU', 'Oceania', 'Australia and New Zealand', null, '009', '053',
        null, '🇦🇺');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Austria', 'AT', 'AUT', '040', 'ISO 3166-2:AT', 'Europe', 'Western Europe', null, '150', '155', null, '🇦🇹');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Azerbaijan', 'AZ', 'AZE', '031', 'ISO 3166-2:AZ', 'Asia', 'Western Asia', null, '142', '145', null, '🇦🇿');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Bahamas', 'BS', 'BHS', '044', 'ISO 3166-2:BS', 'Americas', 'Latin America and the Caribbean', 'Caribbean',
        '019', '419', '029', '🇧🇸');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Bahrain', 'BH', 'BHR', '048', 'ISO 3166-2:BH', 'Asia', 'Western Asia', null, '142', '145', null, '🇧🇭');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Bangladesh', 'BD', 'BGD', '050', 'ISO 3166-2:BD', 'Asia', 'Southern Asia', null, '142', '034', null, '🇧🇩');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Barbados', 'BB', 'BRB', '052', 'ISO 3166-2:BB', 'Americas', 'Latin America and the Caribbean', 'Caribbean',
        '019', '419', '029', '🇧🇧');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Belarus', 'BY', 'BLR', '112', 'ISO 3166-2:BY', 'Europe', 'Eastern Europe', null, '150', '151', null, '🇧🇾');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Belgium', 'BE', 'BEL', '056', 'ISO 3166-2:BE', 'Europe', 'Western Europe', null, '150', '155', null, '🇧🇪');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Belize', 'BZ', 'BLZ', '084', 'ISO 3166-2:BZ', 'Americas', 'Latin America and the Caribbean', 'Central America',
        '019', '419', '013', '🇧🇿');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Benin', 'BJ', 'BEN', '204', 'ISO 3166-2:BJ', 'Africa', 'Sub-Saharan Africa', 'Western Africa', '002', '202',
        '011', '🇧🇯');
INSERT INTO cabrito.country (country_name, country_id, country_id3, country_code, iso_3166_2, region, sub_region,
                             intermediate_region, region_code, sub_region_code, intermediate_region_code, flag_emoji)
VALUES ('Bermuda', 'BM', 'BMU', '060', 'ISO 3166-2:BM', 'Americas', 'Northern America', null, '019', '021', null, '🇧🇲');



