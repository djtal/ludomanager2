# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

COUNTRIES = [
  [1,   'AD', 'Andorra', 'EUR'],
  [2,   'AE', 'United Arab Emirates', 'AED'],
  [3,   'AF', 'Afghanistan', 'AFA'],
  [4,   'AG', 'Antigua and Barbuda', 'XCD'],
  [5,   'AI', 'Anguilla', 'XCD'],
  [6,   'AL', 'Albania', 'ALL'],
  [7,   'AM', 'Armenia', 'AMD'],
  [8,   'AN', 'Netherlands Antilles', 'ANG'],
  [9,   'AO', 'Angola', 'AON'],
  [10,  'AQ', 'Antarctica', 'NOK'],
  [11,  'AR', 'Argentina', 'ARA'],
  [12,  'AS', 'American Samoa', 'USD'],
  [13,  'AT', 'Austria', 'EUR'],
  [14,  'AU', 'Australia', 'AUD'],
  [15,  'AW', 'Aruba', 'AWG'],
  [16,  'AZ', 'Azerbaijan', 'AZM'],
  [17,  'BA', 'Bosnia and Herzegovina', 'BAM'],
  [18,  'BB', 'Barbados', 'BBD'],
  [19,  'BD', 'Bangladesh', 'BDT'],
  [20,  'BE', 'Belgium', 'EUR'],
  [21,  'BF', 'Burkina Faso', 'XAF'],
  [22,  'BG', 'Bulgaria', 'BGL'],
  [23,  'BH', 'Bahrain', 'BHD'],
  [24,  'BI', 'Burundi', 'BIF'],
  [25,  'BJ', 'Benin', 'XAF'],
  [26,  'BM', 'Bermuda', 'BMD'],
  [27,  'BN', 'Brunei Darussalam', 'BND'],
  [28,  'BO', 'Bolivia', 'BOB'],
  [29,  'BR', 'Brazil', 'BRR'],
  [30,  'BS', 'Bahamas', 'BSD'],
  [31,  'BT', 'Bhutan', 'BTN'],
  [32,  'BV', 'Bouvet Island', 'NOK'],
  [33,  'BW', 'Botswana', 'BWP'],
  [34,  'BY', 'Belarus', 'BYR'],
  [35,  'BZ', 'Belize', 'BZD'],
  [36,  'CA', 'Canada', 'CAD'],
  [37,  'CC', 'Cocos  Islands', 'AUD'],
  [38,  'CD', 'Congo', 'XAF'],
  [39,  'CF', 'Central African Republic', 'XAF'],
  [40,  'CG', 'Congo', 'XAF'],
  [41,  'CH', 'Switzerland', 'CHF'],
  [42,  'CI', 'Cote d’Ivoire', 'XAF'],
  [43,  'CK', 'Cook Islands', 'NZD'],
  [44,  'CL', 'Chile', 'CLF'],
  [45,  'CM', 'Cameroon', 'XAF'],
  [46,  'CN', 'China', 'CNY'],
  [47,  'CO', 'Colombia', 'COP'],
  [48,  'CR', 'Costa Rica', 'CRC'],
  [49,  'CS', 'Serbia and Montenegro', 'CSD'],
  [50,  'CU', 'Cuba', 'CUP'],
  [51,  'CV', 'Cape Verde', 'CVE'],
  [52,  'CX', 'Christmas Island', 'AUD'],
  [53,  'CY', 'Cyprus', 'CYP'],
  [54,  'CZ', 'Czech Republic', 'CZK'],
  [55,  'DE', 'Germany', 'EUR'],
  [56,  'DJ', 'Djibouti', 'DJF'],
  [57,  'DK', 'Denmark', 'DKK'],
  [58,  'DM', 'Dominica', 'XCD'],
  [59,  'DO', 'Dominican Republic', 'DOP'],
  [60,  'DZ', 'Algeria', 'DZD'],
  [61,  'EC', 'Ecuador', 'USD'],
  [62,  'EE', 'Estonia', 'EEK'],
  [63,  'EG', 'Egypt', 'EGP'],
  [64,  'EH', 'Western Sahara', 'MAD'],
  [65,  'ER', 'Eritrea', 'ERN'],
  [66,  'ES', 'Spain', 'EUR'],
  [67,  'ET', 'Ethiopia', 'ETB'],
  [240, 'FC', 'Corsica', 'EUR'],
  [68,  'FI', 'Finland', 'EUR'],
  [69,  'FJ', 'Fiji', 'FJD'],
  [70,  'FK', 'Falkland Islands', 'FKP'],
  [71,  'FM', 'Micronesia', 'USD'],
  [72,  'FO', 'Faeroe Islands', 'DKK'],
  [73,  'FR', 'France', 'EUR'],
  [74,  'GA', 'Gabon', 'XAF'],
  [75,  'GB', 'United Kingdom', 'GBP'],
  [76,  'GD', 'Grenada', 'XCD'],
  [77,  'GE', 'Georgia', 'GEL'],
  [78,  'GF', 'French Guiana', 'EUR'],
  [79,  'GH', 'Ghana', 'GHC'],
  [80,  'GI', 'Gibraltar', 'GIP'],
  [81,  'GL', 'Greenland', 'DKK'],
  [82,  'GM', 'Gambia', 'GMD'],
  [83,  'GN', 'Guinea', 'GNS'],
  [84,  'GP', 'Guadaloupe', 'EUR'],
  [85,  'GQ', 'Equatorial Guinea', 'XAF'],
  [86,  'GR', 'Greece', 'EUR'],
  [87,  'GS', 'South Georgia and the South Sandwich Islands', 'GBP'],
  [88,  'GT', 'Guatemala', 'GTQ'],
  [89,  'GU', 'Guam', 'USD'],
  [90,  'GW', 'Guinea-Bissau', 'GWP'],
  [91,  'GY', 'Guyana', 'GYD'],
  [92,  'HK', 'Hong Kong', 'HKD'],
  [93,  'HM', 'Heard and McDonald Islands', 'AUD'],
  [94,  'HN', 'Honduras', 'HNL'],
  [95,  'HR', 'Hrvatska', 'HRK'],
  [96,  'HT', 'Haiti', 'HTG'],
  [97,  'HU', 'Hungary', 'HUF'],
  [98,  'ID', 'Indonesia', 'IDR'],
  [99,  'IE', 'Ireland', 'EUR'],
  [100, 'IL', 'Israel', 'ILS'],
  [101, 'IN', 'India', 'INR'],
  [102, 'IO', 'British Indian Ocean Territory', 'GBP'],
  [103, 'IQ', 'Iraq', 'IQD'],
  [104, 'IR', 'Iran', 'IRR'],
  [105, 'IS', 'Iceland', 'ISK'],
  [106, 'IT', 'Italy', 'EUR'],
  [107, 'JM', 'Jamaica', 'JMD'],
  [108, 'JO', 'Jordan', 'JOD'],
  [109, 'JP', 'Japan', 'JPY'],
  [110, 'KE', 'Kenya', 'KES'],
  [111, 'KG', 'Kyrgyz Republic', 'KGS'],
  [112, 'KH', 'Cambodia', 'KHR'],
  [113, 'KI', 'Kiribati', 'AUD'],
  [114, 'KM', 'Comoros', 'KMF'],
  [115, 'KN', 'St. Kitts and Nevis', 'XCD'],
  [116, 'KP', 'Korea', 'KPW'],
  [117, 'KR', 'Korea', 'KRW'],
  [118, 'KW', 'Kuwait', 'KWD'],
  [119, 'KY', 'Cayman Islands', 'KYD'],
  [120, 'KZ', 'Kazakhstan', 'KZT'],
  [121, 'LA', 'Lao People’s Democratic Republic', 'LAK'],
  [122, 'LB', 'Lebanon', 'LBP'],
  [123, 'LC', 'St. Lucia', 'XCD'],
  [124, 'LI', 'Liechtenstein', 'CHF'],
  [125, 'LK', 'Sri Lanka', 'LKR'],
  [126, 'LR', 'Liberia', 'LRD'],
  [127, 'LS', 'Lesotho', 'LSL'],
  [128, 'LT', 'Lithuania', 'LTL'],
  [129, 'LU', 'Luxembourg', 'EUR'],
  [130, 'LV', 'Latvia', 'LVL'],
  [131, 'LY', 'Libyan Arab Jamahiriya', 'LYD'],
  [132, 'MA', 'Morocco', 'MAD'],
  [133, 'MC', 'Monaco', 'EUR'],
  [134, 'MD', 'Moldova', 'MDL'],
  [135, 'MG', 'Madagascar', 'MGF'],
  [136, 'MH', 'Marshall Islands', 'USD'],
  [137, 'MK', 'Macedonia', 'MKD'],
  [138, 'ML', 'Mali', 'XAF'],
  [139, 'MM', 'Myanmar', 'MMK'],
  [140, 'MN', 'Mongolia', 'MNT'],
  [141, 'MO', 'Macao', 'MOP'],
  [142, 'MP', 'Northern Mariana Islands', 'USD'],
  [143, 'MQ', 'Martinique', 'EUR'],
  [144, 'MR', 'Mauritania', 'MRO'],
  [145, 'MS', 'Montserrat', 'XCD'],
  [146, 'MT', 'Malta', 'MTL'],
  [147, 'MU', 'Mauritius', 'MUR'],
  [148, 'MV', 'Maldives', 'MVR'],
  [149, 'MW', 'Malawi', 'MWK'],
  [150, 'MX', 'Mexico', 'MXN'],
  [151, 'MY', 'Malaysia', 'MYR'],
  [152, 'MZ', 'Mozambique', 'MZM'],
  [153, 'NA', 'Namibia', 'NAD'],
  [154, 'NC', 'New Caledonia', 'XPF'],
  [155, 'NE', 'Niger', 'XOF'],
  [156, 'NF', 'Norfolk Island', 'AUD'],
  [157, 'NG', 'Nigeria', 'NGN'],
  [158, 'NI', 'Nicaragua', 'NIC'],
  [159, 'NL', 'Netherlands', 'EUR'],
  [160, 'NO', 'Norway', 'NOK'],
  [161, 'NP', 'Nepal', 'NPR'],
  [162, 'NR', 'Nauru', 'AUD'],
  [163, 'NU', 'Niue', 'NZD'],
  [164, 'NZ', 'New Zealand', 'NZD'],
  [165, 'OM', 'Oman', 'OMR'],
  [166, 'PA', 'Panama', 'PAB'],
  [167, 'PE', 'Peru', 'PEI'],
  [168, 'PF', 'French Polynesia', 'XPF'],
  [169, 'PG', 'Papua New Guinea', 'PGK'],
  [170, 'PH', 'Philippines', 'PHP'],
  [171, 'PK', 'Pakistan', 'PKR'],
  [172, 'PL', 'Poland', 'PLN'],
  [173, 'PM', 'St. Pierre and Miquelon', 'EUR'],
  [174, 'PN', 'Pitcairn Island', 'NZD'],
  [175, 'PR', 'Puerto Rico', 'USD'],
  [176, 'PS', 'Palestinian Territory', 'ILS'],
  [177, 'PT', 'Portugal', 'EUR'],
  [178, 'PW', 'Palau', 'USD'],
  [179, 'PY', 'Paraguay', 'PYG'],
  [180, 'QA', 'Qatar', 'QAR'],
  [181, 'RE', 'Reunion', 'EUR'],
  [182, 'RO', 'Romania', 'ROL'],
  [183, 'RU', 'Russian Federation', 'RUB'],
  [184, 'RW', 'Rwanda', 'RWF'],
  [185, 'SA', 'Saudi Arabia', 'SAR'],
  [186, 'SB', 'Solomon Islands', 'SBD'],
  [187, 'SC', 'Seychelles', 'SCR'],
  [188, 'SD', 'Sudan', 'SDP'],
  [189, 'SE', 'Sweden', 'SEK'],
  [190, 'SG', 'Singapore', 'SGD'],
  [191, 'SH', 'St. Helena', 'SHP'],
  [192, 'SI', 'Slovenia', 'SIT'],
  [193, 'SJ', 'Svalbard & Jan Mayen Islands', 'NOK'],
  [194, 'SK', 'Slovakia', 'SKK'],
  [195, 'SL', 'Sierra Leone', 'SLL'],
  [196, 'SM', 'San Marino', 'EUR'],
  [197, 'SN', 'Senegal', 'XOF'],
  [198, 'SO', 'Somalia', 'SOS'],
  [199, 'SR', 'Suriname', 'SRG'],
  [200, 'ST', 'Sao Tome and Principe', 'STD'],
  [201, 'SV', 'El Salvador', 'SVC'],
  [202, 'SY', 'Syrian Arab Republic', 'SYP'],
  [203, 'SZ', 'Swaziland', 'SZL'],
  [204, 'TC', 'Turks and Caicos Islands', 'USD'],
  [205, 'TD', 'Chad', 'XAF'],
  [206, 'TF', 'French Southern Territories', 'EUR'],
  [207, 'TG', 'Togo', 'XAF'],
  [208, 'TH', 'Thailand', 'THB'],
  [209, 'TJ', 'Tajikistan', 'TJR'],
  [210, 'TK', 'Tokelau', 'NZD'],
  [211, 'TL', 'Timor-Leste', 'USD'],
  [212, 'TM', 'Turkmenistan', 'TMM'],
  [213, 'TN', 'Tunisia', 'TND'],
  [214, 'TO', 'Tonga', 'TOP'],
  [215, 'TR', 'Turkey', 'TRL'],
  [216, 'TT', 'Trinidad and Tobago', 'TTD'],
  [217, 'TV', 'Tuvalu', 'AUD'],
  [218, 'TW', 'Taiwan', 'TWD'],
  [219, 'TZ', 'Tanzania', 'TZS'],
  [220, 'UA', 'Ukraine', 'UAH'],
  [221, 'UG', 'Uganda', 'UGS'],
  [222, 'UM', 'United States Minor Outlying Islands', 'USD'],
  [223, 'US', 'United States of America', 'USD'],
  [224, 'UY', 'Uruguay', 'UYU'],
  [225, 'UZ', 'Uzbekistan', 'UZS'],
  [226, 'VA', 'Holy See', 'EUR'],
  [227, 'VC', 'St. Vincent and the Grenadines', 'XCD'],
  [228, 'VE', 'Venezuela', 'VEB'],
  [229, 'VG', 'British Virgin Islands', 'USD'],
  [230, 'VI', 'US Virgin Islands', 'USD'],
  [231, 'VN', 'Viet Nam', 'VND'],
  [232, 'VU', 'Vanuatu', 'VUV'],
  [233, 'WF', 'Wallis and Futuna Islands', 'XPF'],
  [234, 'WS', 'Samoa', 'WST'],
  [235, 'YE', 'Yemen', 'YER'],
  [236, 'YT', 'Mayotte', 'EUR'],
  [237, 'ZA', 'South Africa', 'ZAR'],
  [238, 'ZM', 'Zambia', 'ZMK'],
  [239, 'ZW', 'Zimbabwe', 'ZWD']
].freeze




def load_countries
  Country.destroy_all
  Country.connection.reset_pk_sequence!("countries")
  COUNTRIES.each do |(_, code, name)|
    co = Country.new do |c|
      c.code = code
      c.name = name
    end
    co.save
  end
end


load_countries
