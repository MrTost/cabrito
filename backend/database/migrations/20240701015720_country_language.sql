create table cabrito.country_language
(
    country_id varchar(2) not null
        constraint country_language_fk1
            references cabrito.country,
    lang_id    varchar(3) not null
        constraint country_language_fk2
            references cabrito.language,
    constraint country_language_pk
        primary key (country_id, lang_id)
);

INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('AD', 'cat');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('AD', 'spa');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('AE', 'ara');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('AF', 'pus');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('AG', 'eng');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('AI', 'eng');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('AL', 'sqi');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('AM', 'hye');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('AO', 'por');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('AR', 'spa');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('AS', 'eng');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('AT', 'deu');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('AU', 'eng');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('AW', 'nld');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('AX', 'swe');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('AZ', 'aze');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('BA', 'bos');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('BB', 'eng');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('BD', 'ben');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('BE', 'nld');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('BF', 'fra');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('BG', 'bul');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('BH', 'ara');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('BI', 'run');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('BJ', 'fra');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('BL', 'fra');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('BM', 'eng');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('BN', 'msa');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('BO', 'spa');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('BQ', 'nld');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('BR', 'por');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('BS', 'eng');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('BT', 'dzo');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('BV', 'und');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('BW', 'eng');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('BY', 'bel');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('BZ', 'eng');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('CA', 'eng');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('CC', 'msa');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('CD', 'swa');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('CF', 'fra');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('CG', 'fra');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('CH', 'deu');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('CI', 'fra');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('CK', 'eng');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('CL', 'spa');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('CM', 'fra');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('CO', 'spa');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('CR', 'spa');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('CU', 'spa');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('CV', 'por');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('CW', 'nld');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('CX', 'eng');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('CY', 'ell');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('CZ', 'ces');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('DE', 'deu');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('DJ', 'ara');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('DK', 'dan');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('DM', 'eng');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('DO', 'spa');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('DZ', 'ara');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('EC', 'spa');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('EE', 'est');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('EG', 'ara');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('EH', 'ara');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('ER', 'ara');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('ES', 'spa');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('ET', 'amh');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('FI', 'fin');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('FJ', 'eng');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('FM', 'eng');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('FO', 'fao');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('FR', 'fra');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('GA', 'fra');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('GB', 'eng');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('GD', 'eng');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('GE', 'kat');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('GF', 'fra');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('GG', 'eng');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('GH', 'eng');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('GI', 'eng');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('GL', 'kal');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('GM', 'eng');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('GN', 'fra');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('GP', 'fra');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('GQ', 'spa');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('GR', 'ell');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('GT', 'spa');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('GU', 'eng');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('GW', 'por');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('GY', 'eng');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('HK', 'zho');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('HM', 'und');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('HN', 'spa');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('HR', 'hrv');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('HT', 'fra');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('HU', 'hun');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('ID', 'ind');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('IE', 'eng');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('IL', 'heb');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('IM', 'eng');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('IN', 'hin');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('IO', 'eng');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('IQ', 'ara');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('IR', 'fas');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('IS', 'isl');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('IT', 'ita');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('JE', 'eng');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('JM', 'eng');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('JO', 'ara');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('JP', 'jpn');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('KE', 'eng');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('KG', 'rus');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('KH', 'khm');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('KI', 'eng');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('KM', 'fra');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('KN', 'eng');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('KP', 'kor');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('KR', 'kor');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('KW', 'ara');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('KY', 'eng');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('KZ', 'kaz');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('LA', 'lao');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('LB', 'ara');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('LC', 'eng');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('LI', 'deu');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('LK', 'sin');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('LR', 'eng');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('LS', 'eng');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('LT', 'lit');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('LU', 'fra');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('LV', 'lav');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('LY', 'ara');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('MA', 'ara');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('MC', 'fra');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('MD', 'ron');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('ME', 'srp');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('MF', 'fra');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('MG', 'fra');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('MH', 'eng');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('MK', 'mkd');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('ML', 'fra');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('MM', 'mya');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('MN', 'mon');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('MO', 'zho');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('MP', 'eng');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('MQ', 'fra');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('MR', 'ara');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('MS', 'eng');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('MT', 'mlt');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('MU', 'fra');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('MV', 'div');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('MW', 'eng');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('MX', 'spa');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('MY', 'msa');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('MZ', 'por');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('NA', 'eng');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('NC', 'fra');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('NE', 'fra');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('NF', 'eng');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('NG', 'eng');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('NI', 'spa');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('NL', 'nld');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('NO', 'nor');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('NP', 'nep');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('NR', 'eng');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('NU', 'eng');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('NZ', 'eng');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('OM', 'ara');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('PA', 'spa');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('PE', 'spa');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('PF', 'fra');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('PG', 'eng');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('PH', 'fil');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('PK', 'urd');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('PL', 'pol');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('PM', 'fra');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('PN', 'eng');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('PR', 'spa');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('PT', 'por');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('PW', 'eng');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('PY', 'spa');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('QA', 'ara');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('RE', 'fra');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('RO', 'ron');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('RS', 'srp');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('RU', 'rus');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('RW', 'eng');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('SA', 'ara');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('SB', 'eng');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('SC', 'fra');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('SD', 'ara');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('SE', 'swe');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('SG', 'zho');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('SH', 'eng');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('SI', 'slv');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('SJ', 'nob');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('SK', 'slk');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('SL', 'eng');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('SM', 'ita');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('SN', 'fra');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('SO', 'som');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('SR', 'nld');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('SS', 'eng');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('ST', 'por');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('SV', 'spa');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('SX', 'nld');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('SY', 'ara');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('SZ', 'eng');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('TC', 'eng');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('TD', 'ara');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('TF', 'fra');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('TG', 'fra');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('TH', 'tha');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('TJ', 'tgk');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('TK', 'eng');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('TL', 'por');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('TM', 'tuk');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('TN', 'ara');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('TO', 'eng');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('TR', 'tur');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('TT', 'eng');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('TV', 'tvl');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('TW', 'zho');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('TZ', 'swa');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('UA', 'ukr');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('UG', 'eng');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('UM', 'eng');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('US', 'eng');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('UY', 'spa');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('UZ', 'uzb');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('VA', 'ita');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('VC', 'eng');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('VE', 'spa');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('VG', 'eng');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('VI', 'eng');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('VN', 'vie');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('VU', 'bis');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('WF', 'fra');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('WS', 'eng');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('YE', 'ara');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('YT', 'fra');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('ZA', 'afr');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('ZM', 'eng');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('ZW', 'eng');
INSERT INTO cabrito.country_language (country_id, lang_id)
VALUES ('CN', 'zho');
