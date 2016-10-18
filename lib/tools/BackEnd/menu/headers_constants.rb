module TurboCassandra
  def  self.initialize_headers
    [
        {
            "name": "TI PART",
            "code": "ti_part",
            "type": "string"
        },
        {
            "name": "OE REF",
            "code": "oe_ref_urls",
            "type": "string"
        },
        {
            "name": "Description ",
            "code": "description",
            "type": "string"
        },
        {
            "name": "Turbo Type",
            "code": "turbo_type",
            "type": "string"
        },
        {
            "name": "Ref Manufacturer ",
            "code": "manufacturer",
            "type": "string"
        }
    ]
  end

  def self.initialize_sorters
    [
        {
            "name": "TI PART",
            "code": "ti_part.ti_part_number",
            "type": "string"
        },
        {
            "name": "OE REF",
            "code": "oe_ref_urls.part_number",
            "type": "string"
        },
        {
            "name": "MANUFACTURER",
            "code": "manufacturer.code",
            "type": "int"
        },
        {
            "name": "PRICE",
            "code": "price.5",
            "type": "int"
        }
    ]
  end

  def self.initialize_filters
    [
        {
            "name": "Turbo Type",
            "code": "turbo_type",
            "type": "int",
            "options": [
                {
                    "name": "",
                    "option_id": "",
                    "code": "turbo_type"
                },
                {
                    "name": "3\u0022",
                    "option_id": "361",
                    "code": "turbo_type"
                },
                {
                    "name": "3\u0022\u0022",
                    "option_id": "6618",
                    "code": "turbo_type"
                },
                {
                    "name": "34F",
                    "option_id": "370",
                    "code": "turbo_type"
                },
                {
                    "name": "3A",
                    "option_id": "371",
                    "code": "turbo_type"
                },
                {
                    "name": "3DB",
                    "option_id": "458",
                    "code": "turbo_type"
                },
                {
                    "name": "3FD",
                    "option_id": "364",
                    "code": "turbo_type"
                },
                {
                    "name": "3FE",
                    "option_id": "369",
                    "code": "turbo_type"
                },
                {
                    "name": "3FJ",
                    "option_id": "362",
                    "code": "turbo_type"
                },
                {
                    "name": "3HD",
                    "option_id": "453",
                    "code": "turbo_type"
                },
                {
                    "name": "3HF",
                    "option_id": "466",
                    "code": "turbo_type"
                },
                {
                    "name": "3LD",
                    "option_id": "324",
                    "code": "turbo_type"
                },
                {
                    "name": "3LDA",
                    "option_id": "550",
                    "code": "turbo_type"
                },
                {
                    "name": "3LDB",
                    "option_id": "579",
                    "code": "turbo_type"
                },
                {
                    "name": "3LDZ",
                    "option_id": "459",
                    "code": "turbo_type"
                },
                {
                    "name": "3LE",
                    "option_id": "363",
                    "code": "turbo_type"
                },
                {
                    "name": "3LEP",
                    "option_id": "464",
                    "code": "turbo_type"
                },
                {
                    "name": "3LEU",
                    "option_id": "463",
                    "code": "turbo_type"
                },
                {
                    "name": "3LEZ",
                    "option_id": "465",
                    "code": "turbo_type"
                },
                {
                    "name": "3LJ",
                    "option_id": "554",
                    "code": "turbo_type"
                },
                {
                    "name": "3LK",
                    "option_id": "553",
                    "code": "turbo_type"
                },
                {
                    "name": "3LKS",
                    "option_id": "454",
                    "code": "turbo_type"
                },
                {
                    "name": "3LKU",
                    "option_id": "461",
                    "code": "turbo_type"
                },
                {
                    "name": "3LKY",
                    "option_id": "462",
                    "code": "turbo_type"
                },
                {
                    "name": "3LKZ",
                    "option_id": "460",
                    "code": "turbo_type"
                },
                {
                    "name": "3LM",
                    "option_id": "532",
                    "code": "turbo_type"
                },
                {
                    "name": "3LMC",
                    "option_id": "578",
                    "code": "turbo_type"
                },
                {
                    "name": "3TC",
                    "option_id": "606",
                    "code": "turbo_type"
                },
                {
                    "name": "3TF",
                    "option_id": "4722",
                    "code": "turbo_type"
                },
                {
                    "name": "4",
                    "option_id": "576",
                    "code": "turbo_type"
                },
                {
                    "name": "4\u0022",
                    "option_id": "334",
                    "code": "turbo_type"
                },
                {
                    "name": "4\u0022\u0022",
                    "option_id": "6616",
                    "code": "turbo_type"
                },
                {
                    "name": "4A",
                    "option_id": "552",
                    "code": "turbo_type"
                },
                {
                    "name": "4B",
                    "option_id": "471",
                    "code": "turbo_type"
                },
                {
                    "name": "4BD",
                    "option_id": "470",
                    "code": "turbo_type"
                },
                {
                    "name": "4C",
                    "option_id": "4449",
                    "code": "turbo_type"
                },
                {
                    "name": "4D",
                    "option_id": "572",
                    "code": "turbo_type"
                },
                {
                    "name": "4HD",
                    "option_id": "380",
                    "code": "turbo_type"
                },
                {
                    "name": "4HDS",
                    "option_id": "378",
                    "code": "turbo_type"
                },
                {
                    "name": "4HF",
                    "option_id": "381",
                    "code": "turbo_type"
                },
                {
                    "name": "4L",
                    "option_id": "749",
                    "code": "turbo_type"
                },
                {
                    "name": "4LB",
                    "option_id": "467",
                    "code": "turbo_type"
                },
                {
                    "name": "4LD",
                    "option_id": "4831",
                    "code": "turbo_type"
                },
                {
                    "name": "4LE",
                    "option_id": "309",
                    "code": "turbo_type"
                },
                {
                    "name": "4LEA",
                    "option_id": "565",
                    "code": "turbo_type"
                },
                {
                    "name": "4LEC",
                    "option_id": "557",
                    "code": "turbo_type"
                },
                {
                    "name": "4LEK",
                    "option_id": "323",
                    "code": "turbo_type"
                },
                {
                    "name": "4LEV",
                    "option_id": "333",
                    "code": "turbo_type"
                },
                {
                    "name": "4LF",
                    "option_id": "367",
                    "code": "turbo_type"
                },
                {
                    "name": "4LFA",
                    "option_id": "569",
                    "code": "turbo_type"
                },
                {
                    "name": "4LFC",
                    "option_id": "566",
                    "code": "turbo_type"
                },
                {
                    "name": "4LFK",
                    "option_id": "366",
                    "code": "turbo_type"
                },
                {
                    "name": "4LFV",
                    "option_id": "365",
                    "code": "turbo_type"
                },
                {
                    "name": "4LG",
                    "option_id": "320",
                    "code": "turbo_type"
                },
                {
                    "name": "4LGK",
                    "option_id": "346",
                    "code": "turbo_type"
                },
                {
                    "name": "4LGV",
                    "option_id": "368",
                    "code": "turbo_type"
                },
                {
                    "name": "4LGZ",
                    "option_id": "321",
                    "code": "turbo_type"
                },
                {
                    "name": "4LH",
                    "option_id": "558",
                    "code": "turbo_type"
                },
                {
                    "name": "4LHR",
                    "option_id": "580",
                    "code": "turbo_type"
                },
                {
                    "name": "4MD",
                    "option_id": "379",
                    "code": "turbo_type"
                },
                {
                    "name": "4ME",
                    "option_id": "571",
                    "code": "turbo_type"
                },
                {
                    "name": "4MF",
                    "option_id": "382",
                    "code": "turbo_type"
                },
                {
                    "name": "4MFC",
                    "option_id": "5517",
                    "code": "turbo_type"
                },
                {
                    "name": "4MFW",
                    "option_id": "562",
                    "code": "turbo_type"
                },
                {
                    "name": "4TC",
                    "option_id": "581",
                    "code": "turbo_type"
                },
                {
                    "name": "4TE",
                    "option_id": "560",
                    "code": "turbo_type"
                },
                {
                    "name": "4TF",
                    "option_id": "555",
                    "code": "turbo_type"
                },
                {
                    "name": "4U",
                    "option_id": "575",
                    "code": "turbo_type"
                },
                {
                    "name": "4W",
                    "option_id": "574",
                    "code": "turbo_type"
                },
                {
                    "name": "5HDR",
                    "option_id": "582",
                    "code": "turbo_type"
                },
                {
                    "name": "5MD",
                    "option_id": "474",
                    "code": "turbo_type"
                },
                {
                    "name": "5MDE",
                    "option_id": "473",
                    "code": "turbo_type"
                },
                {
                    "name": "5MDY",
                    "option_id": "472",
                    "code": "turbo_type"
                },
                {
                    "name": "5MF",
                    "option_id": "690",
                    "code": "turbo_type"
                },
                {
                    "name": "5MFC",
                    "option_id": "2762",
                    "code": "turbo_type"
                },
                {
                    "name": "5MFW",
                    "option_id": "1910",
                    "code": "turbo_type"
                },
                {
                    "name": "6\u0022",
                    "option_id": "332",
                    "code": "turbo_type"
                },
                {
                    "name": "6\u0022\u0022",
                    "option_id": "6617",
                    "code": "turbo_type"
                },
                {
                    "name": "6D",
                    "option_id": "385",
                    "code": "turbo_type"
                },
                {
                    "name": "6LD",
                    "option_id": "384",
                    "code": "turbo_type"
                },
                {
                    "name": "6U",
                    "option_id": "383",
                    "code": "turbo_type"
                },
                {
                    "name": "AVNT37",
                    "option_id": "6377",
                    "code": "turbo_type"
                },
                {
                    "name": "B01G",
                    "option_id": "7517",
                    "code": "turbo_type"
                },
                {
                    "name": "B01V",
                    "option_id": "7515",
                    "code": "turbo_type"
                },
                {
                    "name": "B03",
                    "option_id": "7125",
                    "code": "turbo_type"
                },
                {
                    "name": "B03G",
                    "option_id": "7094",
                    "code": "turbo_type"
                },
                {
                    "name": "B1",
                    "option_id": "633",
                    "code": "turbo_type"
                },
                {
                    "name": "B1G",
                    "option_id": "634",
                    "code": "turbo_type"
                },
                {
                    "name": "B1RG",
                    "option_id": "7408",
                    "code": "turbo_type"
                },
                {
                    "name": "B1UG",
                    "option_id": "7419",
                    "code": "turbo_type"
                },
                {
                    "name": "B2",
                    "option_id": "452",
                    "code": "turbo_type"
                },
                {
                    "name": "B2CG",
                    "option_id": "7394",
                    "code": "turbo_type"
                },
                {
                    "name": "B2DG",
                    "option_id": "7310",
                    "code": "turbo_type"
                },
                {
                    "name": "B2FS",
                    "option_id": "7421",
                    "code": "turbo_type"
                },
                {
                    "name": "B2G",
                    "option_id": "632",
                    "code": "turbo_type"
                },
                {
                    "name": "B2G004",
                    "option_id": "7376",
                    "code": "turbo_type"
                },
                {
                    "name": "B2G008",
                    "option_id": "7374",
                    "code": "turbo_type"
                },
                {
                    "name": "B2NG",
                    "option_id": "7401",
                    "code": "turbo_type"
                },
                {
                    "name": "B2UG",
                    "option_id": "7337",
                    "code": "turbo_type"
                },
                {
                    "name": "B2UV",
                    "option_id": "7201",
                    "code": "turbo_type"
                },
                {
                    "name": "B2V",
                    "option_id": "7382",
                    "code": "turbo_type"
                },
                {
                    "name": "B2XG",
                    "option_id": "7413",
                    "code": "turbo_type"
                },
                {
                    "name": "B3",
                    "option_id": "5417",
                    "code": "turbo_type"
                },
                {
                    "name": "B3G",
                    "option_id": "635",
                    "code": "turbo_type"
                },
                {
                    "name": "B3NG",
                    "option_id": "7346",
                    "code": "turbo_type"
                },
                {
                    "name": "B3NS",
                    "option_id": "7404",
                    "code": "turbo_type"
                },
                {
                    "name": "B3RS",
                    "option_id": "7416",
                    "code": "turbo_type"
                },
                {
                    "name": "BGTV75",
                    "option_id": "264",
                    "code": "turbo_type"
                },
                {
                    "name": "BHT3B",
                    "option_id": "373",
                    "code": "turbo_type"
                },
                {
                    "name": "BHT3C",
                    "option_id": "375",
                    "code": "turbo_type"
                },
                {
                    "name": "BHT3E",
                    "option_id": "372",
                    "code": "turbo_type"
                },
                {
                    "name": "BHT4C",
                    "option_id": "339",
                    "code": "turbo_type"
                },
                {
                    "name": "BOBG",
                    "option_id": "7335",
                    "code": "turbo_type"
                },
                {
                    "name": "BORV",
                    "option_id": "7520",
                    "code": "turbo_type"
                },
                {
                    "name": "BTG55",
                    "option_id": "744",
                    "code": "turbo_type"
                },
                {
                    "name": "BTG75",
                    "option_id": "274",
                    "code": "turbo_type"
                },
                {
                    "name": "BTL55",
                    "option_id": "266",
                    "code": "turbo_type"
                },
                {
                    "name": "BTL75",
                    "option_id": "263",
                    "code": "turbo_type"
                },
                {
                    "name": "BTL85",
                    "option_id": "244",
                    "code": "turbo_type"
                },
                {
                    "name": "BTLV75",
                    "option_id": "752",
                    "code": "turbo_type"
                },
                {
                    "name": "BTV55",
                    "option_id": "262",
                    "code": "turbo_type"
                },
                {
                    "name": "BTV75",
                    "option_id": "239",
                    "code": "turbo_type"
                },
                {
                    "name": "BTV85",
                    "option_id": "258",
                    "code": "turbo_type"
                },
                {
                    "name": "BTW75",
                    "option_id": "265",
                    "code": "turbo_type"
                },
                {
                    "name": "BV30",
                    "option_id": "6576",
                    "code": "turbo_type"
                },
                {
                    "name": "BV35",
                    "option_id": "6167",
                    "code": "turbo_type"
                },
                {
                    "name": "BV38",
                    "option_id": "7214",
                    "code": "turbo_type"
                },
                {
                    "name": "BV39",
                    "option_id": "671",
                    "code": "turbo_type"
                },
                {
                    "name": "BV40",
                    "option_id": "5843",
                    "code": "turbo_type"
                },
                {
                    "name": "BV43",
                    "option_id": "5596",
                    "code": "turbo_type"
                },
                {
                    "name": "BV45",
                    "option_id": "7343",
                    "code": "turbo_type"
                },
                {
                    "name": "BV50",
                    "option_id": "5521",
                    "code": "turbo_type"
                },
                {
                    "name": "BV55",
                    "option_id": "7471",
                    "code": "turbo_type"
                },
                {
                    "name": "BW085B",
                    "option_id": "6757",
                    "code": "turbo_type"
                },
                {
                    "name": "CT",
                    "option_id": "680",
                    "code": "turbo_type"
                },
                {
                    "name": "CT10",
                    "option_id": "3496",
                    "code": "turbo_type"
                },
                {
                    "name": "CT12",
                    "option_id": "3756",
                    "code": "turbo_type"
                },
                {
                    "name": "CT12A",
                    "option_id": "6628",
                    "code": "turbo_type"
                },
                {
                    "name": "CT12B",
                    "option_id": "679",
                    "code": "turbo_type"
                },
                {
                    "name": "CT20",
                    "option_id": "681",
                    "code": "turbo_type"
                },
                {
                    "name": "CT20\/26",
                    "option_id": "6625",
                    "code": "turbo_type"
                },
                {
                    "name": "CT20B",
                    "option_id": "6007",
                    "code": "turbo_type"
                },
                {
                    "name": "CT26",
                    "option_id": "678",
                    "code": "turbo_type"
                },
                {
                    "name": "CT9",
                    "option_id": "735",
                    "code": "turbo_type"
                },
                {
                    "name": "CTV45",
                    "option_id": "224",
                    "code": "turbo_type"
                },
                {
                    "name": "CTV73",
                    "option_id": "1371",
                    "code": "turbo_type"
                },
                {
                    "name": "CTVNT\/VGT",
                    "option_id": "5629",
                    "code": "turbo_type"
                },
                {
                    "name": "CTW51",
                    "option_id": "676",
                    "code": "turbo_type"
                },
                {
                    "name": "D4U",
                    "option_id": "551",
                    "code": "turbo_type"
                },
                {
                    "name": "D5U",
                    "option_id": "6741",
                    "code": "turbo_type"
                },
                {
                    "name": "E",
                    "option_id": "469",
                    "code": "turbo_type"
                },
                {
                    "name": "EA",
                    "option_id": "564",
                    "code": "turbo_type"
                },
                {
                    "name": "EC",
                    "option_id": "561",
                    "code": "turbo_type"
                },
                {
                    "name": "EFR",
                    "option_id": "7237",
                    "code": "turbo_type"
                },
                {
                    "name": "EN",
                    "option_id": "556",
                    "code": "turbo_type"
                },
                {
                    "name": "F",
                    "option_id": "567",
                    "code": "turbo_type"
                },
                {
                    "name": "F-654",
                    "option_id": "6714",
                    "code": "turbo_type"
                },
                {
                    "name": "FC",
                    "option_id": "563",
                    "code": "turbo_type"
                },
                {
                    "name": "GT12",
                    "option_id": "674",
                    "code": "turbo_type"
                },
                {
                    "name": "GT12V",
                    "option_id": "5445",
                    "code": "turbo_type"
                },
                {
                    "name": "GT14",
                    "option_id": "669",
                    "code": "turbo_type"
                },
                {
                    "name": "GT14V",
                    "option_id": "5505",
                    "code": "turbo_type"
                },
                {
                    "name": "GT15",
                    "option_id": "284",
                    "code": "turbo_type"
                },
                {
                    "name": "GT1541V",
                    "option_id": "657",
                    "code": "turbo_type"
                },
                {
                    "name": "GT1544",
                    "option_id": "692",
                    "code": "turbo_type"
                },
                {
                    "name": "GT1544S",
                    "option_id": "660",
                    "code": "turbo_type"
                },
                {
                    "name": "GT1546",
                    "option_id": "654",
                    "code": "turbo_type"
                },
                {
                    "name": "GT1546S",
                    "option_id": "653",
                    "code": "turbo_type"
                },
                {
                    "name": "GT1549",
                    "option_id": "647",
                    "code": "turbo_type"
                },
                {
                    "name": "GT1549P",
                    "option_id": "658",
                    "code": "turbo_type"
                },
                {
                    "name": "GT1549S",
                    "option_id": "655",
                    "code": "turbo_type"
                },
                {
                    "name": "GT1549V",
                    "option_id": "708",
                    "code": "turbo_type"
                },
                {
                    "name": "GT15P",
                    "option_id": "305",
                    "code": "turbo_type"
                },
                {
                    "name": "GT15V",
                    "option_id": "287",
                    "code": "turbo_type"
                },
                {
                    "name": "GT15Z",
                    "option_id": "306",
                    "code": "turbo_type"
                },
                {
                    "name": "GT16V",
                    "option_id": "304",
                    "code": "turbo_type"
                },
                {
                    "name": "GT17",
                    "option_id": "285",
                    "code": "turbo_type"
                },
                {
                    "name": "GT1746S",
                    "option_id": "665",
                    "code": "turbo_type"
                },
                {
                    "name": "GT1749",
                    "option_id": "642",
                    "code": "turbo_type"
                },
                {
                    "name": "GT1749LS",
                    "option_id": "659",
                    "code": "turbo_type"
                },
                {
                    "name": "GT1749LX",
                    "option_id": "6620",
                    "code": "turbo_type"
                },
                {
                    "name": "GT1749S",
                    "option_id": "666",
                    "code": "turbo_type"
                },
                {
                    "name": "GT1749V",
                    "option_id": "641",
                    "code": "turbo_type"
                },
                {
                    "name": "GT1752",
                    "option_id": "644",
                    "code": "turbo_type"
                },
                {
                    "name": "GT1752O",
                    "option_id": "6621",
                    "code": "turbo_type"
                },
                {
                    "name": "GT1752S",
                    "option_id": "662",
                    "code": "turbo_type"
                },
                {
                    "name": "GT17V",
                    "option_id": "288",
                    "code": "turbo_type"
                },
                {
                    "name": "GT18",
                    "option_id": "302",
                    "code": "turbo_type"
                },
                {
                    "name": "GT1849V",
                    "option_id": "713",
                    "code": "turbo_type"
                },
                {
                    "name": "GT1852",
                    "option_id": "707",
                    "code": "turbo_type"
                },
                {
                    "name": "GT1852V",
                    "option_id": "646",
                    "code": "turbo_type"
                },
                {
                    "name": "GT18V",
                    "option_id": "300",
                    "code": "turbo_type"
                },
                {
                    "name": "GT20",
                    "option_id": "162",
                    "code": "turbo_type"
                },
                {
                    "name": "GT2049",
                    "option_id": "737",
                    "code": "turbo_type"
                },
                {
                    "name": "GT2049S",
                    "option_id": "661",
                    "code": "turbo_type"
                },
                {
                    "name": "GT2052",
                    "option_id": "706",
                    "code": "turbo_type"
                },
                {
                    "name": "GT2052ELS",
                    "option_id": "664",
                    "code": "turbo_type"
                },
                {
                    "name": "GT2052S",
                    "option_id": "649",
                    "code": "turbo_type"
                },
                {
                    "name": "GT2052V",
                    "option_id": "652",
                    "code": "turbo_type"
                },
                {
                    "name": "GT2056S",
                    "option_id": "651",
                    "code": "turbo_type"
                },
                {
                    "name": "GT20V",
                    "option_id": "286",
                    "code": "turbo_type"
                },
                {
                    "name": "GT22",
                    "option_id": "159",
                    "code": "turbo_type"
                },
                {
                    "name": "GT2252",
                    "option_id": "648",
                    "code": "turbo_type"
                },
                {
                    "name": "GT2252V",
                    "option_id": "656",
                    "code": "turbo_type"
                },
                {
                    "name": "GT2256V",
                    "option_id": "712",
                    "code": "turbo_type"
                },
                {
                    "name": "GT2256VK",
                    "option_id": "714",
                    "code": "turbo_type"
                },
                {
                    "name": "GT2259",
                    "option_id": "650",
                    "code": "turbo_type"
                },
                {
                    "name": "GT2259S",
                    "option_id": "6622",
                    "code": "turbo_type"
                },
                {
                    "name": "GT22V",
                    "option_id": "301",
                    "code": "turbo_type"
                },
                {
                    "name": "GT23",
                    "option_id": "299",
                    "code": "turbo_type"
                },
                {
                    "name": "GT2359V",
                    "option_id": "711",
                    "code": "turbo_type"
                },
                {
                    "name": "GT23V",
                    "option_id": "303",
                    "code": "turbo_type"
                },
                {
                    "name": "GT25",
                    "option_id": "156",
                    "code": "turbo_type"
                },
                {
                    "name": "GT2503V",
                    "option_id": "645",
                    "code": "turbo_type"
                },
                {
                    "name": "GT2538C",
                    "option_id": "710",
                    "code": "turbo_type"
                },
                {
                    "name": "GT2552C",
                    "option_id": "6623",
                    "code": "turbo_type"
                },
                {
                    "name": "GT2556S",
                    "option_id": "663",
                    "code": "turbo_type"
                },
                {
                    "name": "GT2556V",
                    "option_id": "643",
                    "code": "turbo_type"
                },
                {
                    "name": "GT2560LS",
                    "option_id": "715",
                    "code": "turbo_type"
                },
                {
                    "name": "GT25C",
                    "option_id": "709",
                    "code": "turbo_type"
                },
                {
                    "name": "GT25V",
                    "option_id": "157",
                    "code": "turbo_type"
                },
                {
                    "name": "GT28",
                    "option_id": "668",
                    "code": "turbo_type"
                },
                {
                    "name": "GT30",
                    "option_id": "297",
                    "code": "turbo_type"
                },
                {
                    "name": "GT32",
                    "option_id": "296",
                    "code": "turbo_type"
                },
                {
                    "name": "GT3271",
                    "option_id": "754",
                    "code": "turbo_type"
                },
                {
                    "name": "GT32V",
                    "option_id": "4502",
                    "code": "turbo_type"
                },
                {
                    "name": "GT35",
                    "option_id": "295",
                    "code": "turbo_type"
                },
                {
                    "name": "GT3576",
                    "option_id": "750",
                    "code": "turbo_type"
                },
                {
                    "name": "GT35V",
                    "option_id": "5633",
                    "code": "turbo_type"
                },
                {
                    "name": "GT37",
                    "option_id": "279",
                    "code": "turbo_type"
                },
                {
                    "name": "GT37V",
                    "option_id": "5587",
                    "code": "turbo_type"
                },
                {
                    "name": "GT37VA",
                    "option_id": "742",
                    "code": "turbo_type"
                },
                {
                    "name": "GT40",
                    "option_id": "280",
                    "code": "turbo_type"
                },
                {
                    "name": "GT40V",
                    "option_id": "6509",
                    "code": "turbo_type"
                },
                {
                    "name": "GT42",
                    "option_id": "294",
                    "code": "turbo_type"
                },
                {
                    "name": "GT42S",
                    "option_id": "218",
                    "code": "turbo_type"
                },
                {
                    "name": "GT45",
                    "option_id": "230",
                    "code": "turbo_type"
                },
                {
                    "name": "GT45V",
                    "option_id": "5546",
                    "code": "turbo_type"
                },
                {
                    "name": "GT47",
                    "option_id": "272",
                    "code": "turbo_type"
                },
                {
                    "name": "GT50",
                    "option_id": "268",
                    "code": "turbo_type"
                },
                {
                    "name": "GT55",
                    "option_id": "677",
                    "code": "turbo_type"
                },
                {
                    "name": "GT60",
                    "option_id": "291",
                    "code": "turbo_type"
                },
                {
                    "name": "GT65",
                    "option_id": "4394",
                    "code": "turbo_type"
                },
                {
                    "name": "GT70",
                    "option_id": "4395",
                    "code": "turbo_type"
                },
                {
                    "name": "GTA37",
                    "option_id": "278",
                    "code": "turbo_type"
                },
                {
                    "name": "GTA40",
                    "option_id": "277",
                    "code": "turbo_type"
                },
                {
                    "name": "GTA42",
                    "option_id": "298",
                    "code": "turbo_type"
                },
                {
                    "name": "GTA50",
                    "option_id": "743",
                    "code": "turbo_type"
                },
                {
                    "name": "GTA55",
                    "option_id": "745",
                    "code": "turbo_type"
                },
                {
                    "name": "GTP38",
                    "option_id": "282",
                    "code": "turbo_type"
                },
                {
                    "name": "GTP45",
                    "option_id": "6629",
                    "code": "turbo_type"
                },
                {
                    "name": "H1",
                    "option_id": "350",
                    "code": "turbo_type"
                },
                {
                    "name": "H1A",
                    "option_id": "349",
                    "code": "turbo_type"
                },
                {
                    "name": "H1B",
                    "option_id": "351",
                    "code": "turbo_type"
                },
                {
                    "name": "H1C",
                    "option_id": "357",
                    "code": "turbo_type"
                },
                {
                    "name": "H1D",
                    "option_id": "353",
                    "code": "turbo_type"
                },
                {
                    "name": "H1E",
                    "option_id": "356",
                    "code": "turbo_type"
                },
                {
                    "name": "H2A",
                    "option_id": "335",
                    "code": "turbo_type"
                },
                {
                    "name": "H2B",
                    "option_id": "313",
                    "code": "turbo_type"
                },
                {
                    "name": "H2C",
                    "option_id": "315",
                    "code": "turbo_type"
                },
                {
                    "name": "H2D",
                    "option_id": "318",
                    "code": "turbo_type"
                },
                {
                    "name": "H2E",
                    "option_id": "317",
                    "code": "turbo_type"
                },
                {
                    "name": "H2S",
                    "option_id": "314",
                    "code": "turbo_type"
                },
                {
                    "name": "H3B",
                    "option_id": "326",
                    "code": "turbo_type"
                },
                {
                    "name": "HC3",
                    "option_id": "329",
                    "code": "turbo_type"
                },
                {
                    "name": "HC3B",
                    "option_id": "330",
                    "code": "turbo_type"
                },
                {
                    "name": "HC5",
                    "option_id": "344",
                    "code": "turbo_type"
                },
                {
                    "name": "HC5A",
                    "option_id": "342",
                    "code": "turbo_type"
                },
                {
                    "name": "HC5B",
                    "option_id": "345",
                    "code": "turbo_type"
                },
                {
                    "name": "HE201W",
                    "option_id": "1979",
                    "code": "turbo_type"
                },
                {
                    "name": "HE211W",
                    "option_id": "968",
                    "code": "turbo_type"
                },
                {
                    "name": "HE221W",
                    "option_id": "337",
                    "code": "turbo_type"
                },
                {
                    "name": "HE300FG",
                    "option_id": "399",
                    "code": "turbo_type"
                },
                {
                    "name": "HE300VG",
                    "option_id": "5480",
                    "code": "turbo_type"
                },
                {
                    "name": "HE300WG",
                    "option_id": "402",
                    "code": "turbo_type"
                },
                {
                    "name": "HE341VE",
                    "option_id": "358",
                    "code": "turbo_type"
                },
                {
                    "name": "HE341VH",
                    "option_id": "5462",
                    "code": "turbo_type"
                },
                {
                    "name": "HE351CW",
                    "option_id": "421",
                    "code": "turbo_type"
                },
                {
                    "name": "HE351G",
                    "option_id": "432",
                    "code": "turbo_type"
                },
                {
                    "name": "HE351VE",
                    "option_id": "5551",
                    "code": "turbo_type"
                },
                {
                    "name": "HE351W",
                    "option_id": "417",
                    "code": "turbo_type"
                },
                {
                    "name": "HE400FG",
                    "option_id": "398",
                    "code": "turbo_type"
                },
                {
                    "name": "HE400VG",
                    "option_id": "5501",
                    "code": "turbo_type"
                },
                {
                    "name": "HE400WG",
                    "option_id": "388",
                    "code": "turbo_type"
                },
                {
                    "name": "HE431V",
                    "option_id": "433",
                    "code": "turbo_type"
                },
                {
                    "name": "HE431VE",
                    "option_id": "5435",
                    "code": "turbo_type"
                },
                {
                    "name": "HE431VH",
                    "option_id": "5747",
                    "code": "turbo_type"
                },
                {
                    "name": "HE451",
                    "option_id": "400",
                    "code": "turbo_type"
                },
                {
                    "name": "HE451V",
                    "option_id": "6001",
                    "code": "turbo_type"
                },
                {
                    "name": "HE451VE",
                    "option_id": "5448",
                    "code": "turbo_type"
                },
                {
                    "name": "HE500VG",
                    "option_id": "5776",
                    "code": "turbo_type"
                },
                {
                    "name": "HE500WG",
                    "option_id": "406",
                    "code": "turbo_type"
                },
                {
                    "name": "HE531V",
                    "option_id": "434",
                    "code": "turbo_type"
                },
                {
                    "name": "HE531VE",
                    "option_id": "5454",
                    "code": "turbo_type"
                },
                {
                    "name": "HE551",
                    "option_id": "426",
                    "code": "turbo_type"
                },
                {
                    "name": "HE551M",
                    "option_id": "427",
                    "code": "turbo_type"
                },
                {
                    "name": "HE551V",
                    "option_id": "425",
                    "code": "turbo_type"
                },
                {
                    "name": "HE551VE",
                    "option_id": "5430",
                    "code": "turbo_type"
                },
                {
                    "name": "HE551W",
                    "option_id": "424",
                    "code": "turbo_type"
                },
                {
                    "name": "HE561VE",
                    "option_id": "5613",
                    "code": "turbo_type"
                },
                {
                    "name": "HE800FG",
                    "option_id": "435",
                    "code": "turbo_type"
                },
                {
                    "name": "HE800PT",
                    "option_id": "6601",
                    "code": "turbo_type"
                },
                {
                    "name": "HE851",
                    "option_id": "1569",
                    "code": "turbo_type"
                },
                {
                    "name": "HP70",
                    "option_id": "387",
                    "code": "turbo_type"
                },
                {
                    "name": "HP71",
                    "option_id": "6192",
                    "code": "turbo_type"
                },
                {
                    "name": "HP72",
                    "option_id": "436",
                    "code": "turbo_type"
                },
                {
                    "name": "HP81",
                    "option_id": "6559",
                    "code": "turbo_type"
                },
                {
                    "name": "HP82",
                    "option_id": "6444",
                    "code": "turbo_type"
                },
                {
                    "name": "HP841",
                    "option_id": "6606",
                    "code": "turbo_type"
                },
                {
                    "name": "HT06",
                    "option_id": "1894",
                    "code": "turbo_type"
                },
                {
                    "name": "HT07",
                    "option_id": "1692",
                    "code": "turbo_type"
                },
                {
                    "name": "HT10",
                    "option_id": "3870",
                    "code": "turbo_type"
                },
                {
                    "name": "HT100",
                    "option_id": "331",
                    "code": "turbo_type"
                },
                {
                    "name": "HT12",
                    "option_id": "1191",
                    "code": "turbo_type"
                },
                {
                    "name": "HT15",
                    "option_id": "5782",
                    "code": "turbo_type"
                },
                {
                    "name": "HT18",
                    "option_id": "3931",
                    "code": "turbo_type"
                },
                {
                    "name": "HT18-2S",
                    "option_id": "6627",
                    "code": "turbo_type"
                },
                {
                    "name": "HT20",
                    "option_id": "6332",
                    "code": "turbo_type"
                },
                {
                    "name": "HT25",
                    "option_id": "5968",
                    "code": "turbo_type"
                },
                {
                    "name": "HT3B",
                    "option_id": "377",
                    "code": "turbo_type"
                },
                {
                    "name": "HT4B",
                    "option_id": "348",
                    "code": "turbo_type"
                },
                {
                    "name": "HT4C",
                    "option_id": "347",
                    "code": "turbo_type"
                },
                {
                    "name": "HT6",
                    "option_id": "374",
                    "code": "turbo_type"
                },
                {
                    "name": "HT60",
                    "option_id": "376",
                    "code": "turbo_type"
                },
                {
                    "name": "HT60W",
                    "option_id": "412",
                    "code": "turbo_type"
                },
                {
                    "name": "HT80",
                    "option_id": "386",
                    "code": "turbo_type"
                },
                {
                    "name": "HX20",
                    "option_id": "3376",
                    "code": "turbo_type"
                },
                {
                    "name": "HX20W",
                    "option_id": "3658",
                    "code": "turbo_type"
                },
                {
                    "name": "HX25",
                    "option_id": "1564",
                    "code": "turbo_type"
                },
                {
                    "name": "HX25W",
                    "option_id": "1563",
                    "code": "turbo_type"
                },
                {
                    "name": "HX27W",
                    "option_id": "4666",
                    "code": "turbo_type"
                },
                {
                    "name": "HX30",
                    "option_id": "393",
                    "code": "turbo_type"
                },
                {
                    "name": "HX30W",
                    "option_id": "411",
                    "code": "turbo_type"
                },
                {
                    "name": "HX32",
                    "option_id": "401",
                    "code": "turbo_type"
                },
                {
                    "name": "HX32W",
                    "option_id": "396",
                    "code": "turbo_type"
                },
                {
                    "name": "HX35",
                    "option_id": "397",
                    "code": "turbo_type"
                },
                {
                    "name": "HX35G",
                    "option_id": "338",
                    "code": "turbo_type"
                },
                {
                    "name": "HX35M",
                    "option_id": "418",
                    "code": "turbo_type"
                },
                {
                    "name": "HX35W",
                    "option_id": "354",
                    "code": "turbo_type"
                },
                {
                    "name": "HX38G",
                    "option_id": "394",
                    "code": "turbo_type"
                },
                {
                    "name": "HX40",
                    "option_id": "389",
                    "code": "turbo_type"
                },
                {
                    "name": "HX40G",
                    "option_id": "404",
                    "code": "turbo_type"
                },
                {
                    "name": "HX40V",
                    "option_id": "403",
                    "code": "turbo_type"
                },
                {
                    "name": "HX40W",
                    "option_id": "327",
                    "code": "turbo_type"
                },
                {
                    "name": "HX50",
                    "option_id": "319",
                    "code": "turbo_type"
                },
                {
                    "name": "HX50G",
                    "option_id": "360",
                    "code": "turbo_type"
                },
                {
                    "name": "HX50M",
                    "option_id": "359",
                    "code": "turbo_type"
                },
                {
                    "name": "HX50W",
                    "option_id": "336",
                    "code": "turbo_type"
                },
                {
                    "name": "HX52",
                    "option_id": "391",
                    "code": "turbo_type"
                },
                {
                    "name": "HX52W",
                    "option_id": "392",
                    "code": "turbo_type"
                },
                {
                    "name": "HX55",
                    "option_id": "390",
                    "code": "turbo_type"
                },
                {
                    "name": "HX55M",
                    "option_id": "407",
                    "code": "turbo_type"
                },
                {
                    "name": "HX55MW",
                    "option_id": "413",
                    "code": "turbo_type"
                },
                {
                    "name": "HX55V",
                    "option_id": "430",
                    "code": "turbo_type"
                },
                {
                    "name": "HX55W",
                    "option_id": "408",
                    "code": "turbo_type"
                },
                {
                    "name": "HX55WM",
                    "option_id": "405",
                    "code": "turbo_type"
                },
                {
                    "name": "HX60",
                    "option_id": "325",
                    "code": "turbo_type"
                },
                {
                    "name": "HX60W",
                    "option_id": "328",
                    "code": "turbo_type"
                },
                {
                    "name": "HX80",
                    "option_id": "341",
                    "code": "turbo_type"
                },
                {
                    "name": "HX80M",
                    "option_id": "343",
                    "code": "turbo_type"
                },
                {
                    "name": "HX82",
                    "option_id": "322",
                    "code": "turbo_type"
                },
                {
                    "name": "HX82M",
                    "option_id": "423",
                    "code": "turbo_type"
                },
                {
                    "name": "HX83",
                    "option_id": "416",
                    "code": "turbo_type"
                },
                {
                    "name": "HX85",
                    "option_id": "340",
                    "code": "turbo_type"
                },
                {
                    "name": "HY30W",
                    "option_id": "410",
                    "code": "turbo_type"
                },
                {
                    "name": "HY35",
                    "option_id": "422",
                    "code": "turbo_type"
                },
                {
                    "name": "HY35W",
                    "option_id": "419",
                    "code": "turbo_type"
                },
                {
                    "name": "HY40V",
                    "option_id": "428",
                    "code": "turbo_type"
                },
                {
                    "name": "HY55",
                    "option_id": "429",
                    "code": "turbo_type"
                },
                {
                    "name": "HY55V",
                    "option_id": "431",
                    "code": "turbo_type"
                },
                {
                    "name": "K02",
                    "option_id": "5519",
                    "code": "turbo_type"
                },
                {
                    "name": "K03",
                    "option_id": "477",
                    "code": "turbo_type"
                },
                {
                    "name": "K04",
                    "option_id": "476",
                    "code": "turbo_type"
                },
                {
                    "name": "K06",
                    "option_id": "478",
                    "code": "turbo_type"
                },
                {
                    "name": "K0CG",
                    "option_id": "7283",
                    "code": "turbo_type"
                },
                {
                    "name": "K14",
                    "option_id": "480",
                    "code": "turbo_type"
                },
                {
                    "name": "K16",
                    "option_id": "481",
                    "code": "turbo_type"
                },
                {
                    "name": "K1UG",
                    "option_id": "7069",
                    "code": "turbo_type"
                },
                {
                    "name": "K23",
                    "option_id": "746",
                    "code": "turbo_type"
                },
                {
                    "name": "K24",
                    "option_id": "482",
                    "code": "turbo_type"
                },
                {
                    "name": "K26",
                    "option_id": "455",
                    "code": "turbo_type"
                },
                {
                    "name": "K27",
                    "option_id": "395",
                    "code": "turbo_type"
                },
                {
                    "name": "K28",
                    "option_id": "456",
                    "code": "turbo_type"
                },
                {
                    "name": "K29",
                    "option_id": "409",
                    "code": "turbo_type"
                },
                {
                    "name": "K31",
                    "option_id": "483",
                    "code": "turbo_type"
                },
                {
                    "name": "K33",
                    "option_id": "484",
                    "code": "turbo_type"
                },
                {
                    "name": "K34",
                    "option_id": "487",
                    "code": "turbo_type"
                },
                {
                    "name": "K36",
                    "option_id": "457",
                    "code": "turbo_type"
                },
                {
                    "name": "K361",
                    "option_id": "468",
                    "code": "turbo_type"
                },
                {
                    "name": "K365",
                    "option_id": "485",
                    "code": "turbo_type"
                },
                {
                    "name": "K37",
                    "option_id": "486",
                    "code": "turbo_type"
                },
                {
                    "name": "K3CS",
                    "option_id": "7119",
                    "code": "turbo_type"
                },
                {
                    "name": "K3NS",
                    "option_id": "7121",
                    "code": "turbo_type"
                },
                {
                    "name": "K42",
                    "option_id": "488",
                    "code": "turbo_type"
                },
                {
                    "name": "K44",
                    "option_id": "489",
                    "code": "turbo_type"
                },
                {
                    "name": "K52",
                    "option_id": "490",
                    "code": "turbo_type"
                },
                {
                    "name": "K54",
                    "option_id": "491",
                    "code": "turbo_type"
                },
                {
                    "name": "KHF5",
                    "option_id": "4774",
                    "code": "turbo_type"
                },
                {
                    "name": "KO3",
                    "option_id": "475",
                    "code": "turbo_type"
                },
                {
                    "name": "KO4",
                    "option_id": "479",
                    "code": "turbo_type"
                },
                {
                    "name": "KP31",
                    "option_id": "682",
                    "code": "turbo_type"
                },
                {
                    "name": "KP35",
                    "option_id": "667",
                    "code": "turbo_type"
                },
                {
                    "name": "KP39",
                    "option_id": "670",
                    "code": "turbo_type"
                },
                {
                    "name": "KTR100",
                    "option_id": "492",
                    "code": "turbo_type"
                },
                {
                    "name": "KTR10A",
                    "option_id": "747",
                    "code": "turbo_type"
                },
                {
                    "name": "KTR110",
                    "option_id": "494",
                    "code": "turbo_type"
                },
                {
                    "name": "KTR110A",
                    "option_id": "684",
                    "code": "turbo_type"
                },
                {
                    "name": "KTR110B",
                    "option_id": "685",
                    "code": "turbo_type"
                },
                {
                    "name": "KTR110G",
                    "option_id": "686",
                    "code": "turbo_type"
                },
                {
                    "name": "KTR110L",
                    "option_id": "687",
                    "code": "turbo_type"
                },
                {
                    "name": "KTR110M",
                    "option_id": "1558",
                    "code": "turbo_type"
                },
                {
                    "name": "KTR130",
                    "option_id": "493",
                    "code": "turbo_type"
                },
                {
                    "name": "KTR130B",
                    "option_id": "6452",
                    "code": "turbo_type"
                },
                {
                    "name": "KTR130C",
                    "option_id": "683",
                    "code": "turbo_type"
                },
                {
                    "name": "KTR150",
                    "option_id": "6139",
                    "code": "turbo_type"
                },
                {
                    "name": "KTR90",
                    "option_id": "6507",
                    "code": "turbo_type"
                },
                {
                    "name": "KV070",
                    "option_id": "6759",
                    "code": "turbo_type"
                },
                {
                    "name": "MGT12",
                    "option_id": "6090",
                    "code": "turbo_type"
                },
                {
                    "name": "MGT15",
                    "option_id": "6059",
                    "code": "turbo_type"
                },
                {
                    "name": "MGT22",
                    "option_id": "5433",
                    "code": "turbo_type"
                },
                {
                    "name": "Option 1",
                    "option_id": "127",
                    "code": "turbo_type"
                },
                {
                    "name": "Option 2",
                    "option_id": "126",
                    "code": "turbo_type"
                },
                {
                    "name": "Option 3",
                    "option_id": "125",
                    "code": "turbo_type"
                },
                {
                    "name": "Option 4",
                    "option_id": "124",
                    "code": "turbo_type"
                },
                {
                    "name": "R2S",
                    "option_id": "5627",
                    "code": "turbo_type"
                },
                {
                    "name": "RHB3",
                    "option_id": "441",
                    "code": "turbo_type"
                },
                {
                    "name": "RHB4",
                    "option_id": "443",
                    "code": "turbo_type"
                },
                {
                    "name": "RHB5",
                    "option_id": "437",
                    "code": "turbo_type"
                },
                {
                    "name": "RHB52MW",
                    "option_id": "691",
                    "code": "turbo_type"
                },
                {
                    "name": "RHB6",
                    "option_id": "438",
                    "code": "turbo_type"
                },
                {
                    "name": "RHB7",
                    "option_id": "439",
                    "code": "turbo_type"
                },
                {
                    "name": "RHB8",
                    "option_id": "451",
                    "code": "turbo_type"
                },
                {
                    "name": "RHC6",
                    "option_id": "442",
                    "code": "turbo_type"
                },
                {
                    "name": "RHC7",
                    "option_id": "440",
                    "code": "turbo_type"
                },
                {
                    "name": "RHC9",
                    "option_id": "445",
                    "code": "turbo_type"
                },
                {
                    "name": "RHE6",
                    "option_id": "444",
                    "code": "turbo_type"
                },
                {
                    "name": "RHE7",
                    "option_id": "446",
                    "code": "turbo_type"
                },
                {
                    "name": "RHE8",
                    "option_id": "447",
                    "code": "turbo_type"
                },
                {
                    "name": "RHF3",
                    "option_id": "448",
                    "code": "turbo_type"
                },
                {
                    "name": "RHF3H",
                    "option_id": "6624",
                    "code": "turbo_type"
                },
                {
                    "name": "RHF3V",
                    "option_id": "3781",
                    "code": "turbo_type"
                },
                {
                    "name": "RHF4",
                    "option_id": "449",
                    "code": "turbo_type"
                },
                {
                    "name": "RHF4H",
                    "option_id": "748",
                    "code": "turbo_type"
                },
                {
                    "name": "RHF4V",
                    "option_id": "5423",
                    "code": "turbo_type"
                },
                {
                    "name": "RHF5",
                    "option_id": "450",
                    "code": "turbo_type"
                },
                {
                    "name": "RHF5V",
                    "option_id": "5952",
                    "code": "turbo_type"
                },
                {
                    "name": "RHF6",
                    "option_id": "5279",
                    "code": "turbo_type"
                },
                {
                    "name": "RHG6",
                    "option_id": "2456",
                    "code": "turbo_type"
                },
                {
                    "name": "RHG7",
                    "option_id": "5641",
                    "code": "turbo_type"
                },
                {
                    "name": "RHG7V",
                    "option_id": "5803",
                    "code": "turbo_type"
                },
                {
                    "name": "RHG8",
                    "option_id": "6261",
                    "code": "turbo_type"
                },
                {
                    "name": "RHG8V",
                    "option_id": "5863",
                    "code": "turbo_type"
                },
                {
                    "name": "RHG9",
                    "option_id": "5835",
                    "code": "turbo_type"
                },
                {
                    "name": "RHO5",
                    "option_id": "5428",
                    "code": "turbo_type"
                },
                {
                    "name": "RHO6",
                    "option_id": "5524",
                    "code": "turbo_type"
                },
                {
                    "name": "RHO7",
                    "option_id": "5599",
                    "code": "turbo_type"
                },
                {
                    "name": "RHV4",
                    "option_id": "5625",
                    "code": "turbo_type"
                },
                {
                    "name": "RHV5",
                    "option_id": "6045",
                    "code": "turbo_type"
                },
                {
                    "name": "RM-60",
                    "option_id": "6010",
                    "code": "turbo_type"
                },
                {
                    "name": "S100",
                    "option_id": "600",
                    "code": "turbo_type"
                },
                {
                    "name": "S100G",
                    "option_id": "605",
                    "code": "turbo_type"
                },
                {
                    "name": "S100S",
                    "option_id": "5769",
                    "code": "turbo_type"
                },
                {
                    "name": "S130",
                    "option_id": "593",
                    "code": "turbo_type"
                },
                {
                    "name": "S1A",
                    "option_id": "594",
                    "code": "turbo_type"
                },
                {
                    "name": "S1AG",
                    "option_id": "595",
                    "code": "turbo_type"
                },
                {
                    "name": "S1B",
                    "option_id": "528",
                    "code": "turbo_type"
                },
                {
                    "name": "S1BG",
                    "option_id": "596",
                    "code": "turbo_type"
                },
                {
                    "name": "S1BS",
                    "option_id": "7087",
                    "code": "turbo_type"
                },
                {
                    "name": "S200",
                    "option_id": "531",
                    "code": "turbo_type"
                },
                {
                    "name": "S200A",
                    "option_id": "7161",
                    "code": "turbo_type"
                },
                {
                    "name": "S200AC",
                    "option_id": "6953",
                    "code": "turbo_type"
                },
                {
                    "name": "S200AG",
                    "option_id": "616",
                    "code": "turbo_type"
                },
                {
                    "name": "S200BV",
                    "option_id": "7388",
                    "code": "turbo_type"
                },
                {
                    "name": "S200G",
                    "option_id": "597",
                    "code": "turbo_type"
                },
                {
                    "name": "S200S",
                    "option_id": "602",
                    "code": "turbo_type"
                },
                {
                    "name": "S200V",
                    "option_id": "7090",
                    "code": "turbo_type"
                },
                {
                    "name": "S200W",
                    "option_id": "615",
                    "code": "turbo_type"
                },
                {
                    "name": "S2A",
                    "option_id": "524",
                    "code": "turbo_type"
                },
                {
                    "name": "S2AG",
                    "option_id": "610",
                    "code": "turbo_type"
                },
                {
                    "name": "S2AS",
                    "option_id": "591",
                    "code": "turbo_type"
                },
                {
                    "name": "S2ASL",
                    "option_id": "609",
                    "code": "turbo_type"
                },
                {
                    "name": "S2AW",
                    "option_id": "607",
                    "code": "turbo_type"
                },
                {
                    "name": "S2B",
                    "option_id": "515",
                    "code": "turbo_type"
                },
                {
                    "name": "S2BG",
                    "option_id": "598",
                    "code": "turbo_type"
                },
                {
                    "name": "S2BS",
                    "option_id": "514",
                    "code": "turbo_type"
                },
                {
                    "name": "S2BW",
                    "option_id": "516",
                    "code": "turbo_type"
                },
                {
                    "name": "S2C",
                    "option_id": "601",
                    "code": "turbo_type"
                },
                {
                    "name": "S2D",
                    "option_id": "599",
                    "code": "turbo_type"
                },
                {
                    "name": "S2E",
                    "option_id": "613",
                    "code": "turbo_type"
                },
                {
                    "name": "S2ECGL",
                    "option_id": "612",
                    "code": "turbo_type"
                },
                {
                    "name": "S2EG",
                    "option_id": "537",
                    "code": "turbo_type"
                },
                {
                    "name": "S2EGL",
                    "option_id": "536",
                    "code": "turbo_type"
                },
                {
                    "name": "S2EL",
                    "option_id": "534",
                    "code": "turbo_type"
                },
                {
                    "name": "S2ES",
                    "option_id": "611",
                    "code": "turbo_type"
                },
                {
                    "name": "S2ESL",
                    "option_id": "535",
                    "code": "turbo_type"
                },
                {
                    "name": "S2EWL",
                    "option_id": "614",
                    "code": "turbo_type"
                },
                {
                    "name": "S2W",
                    "option_id": "608",
                    "code": "turbo_type"
                },
                {
                    "name": "S3",
                    "option_id": "589",
                    "code": "turbo_type"
                },
                {
                    "name": "S300",
                    "option_id": "530",
                    "code": "turbo_type"
                },
                {
                    "name": "S300A",
                    "option_id": "541",
                    "code": "turbo_type"
                },
                {
                    "name": "S300AG",
                    "option_id": "618",
                    "code": "turbo_type"
                },
                {
                    "name": "S300BV",
                    "option_id": "7080",
                    "code": "turbo_type"
                },
                {
                    "name": "S300C",
                    "option_id": "4529",
                    "code": "turbo_type"
                },
                {
                    "name": "S300CG",
                    "option_id": "6951",
                    "code": "turbo_type"
                },
                {
                    "name": "S300G",
                    "option_id": "542",
                    "code": "turbo_type"
                },
                {
                    "name": "S300S",
                    "option_id": "539",
                    "code": "turbo_type"
                },
                {
                    "name": "S300V",
                    "option_id": "6958",
                    "code": "turbo_type"
                },
                {
                    "name": "S300W",
                    "option_id": "540",
                    "code": "turbo_type"
                },
                {
                    "name": "S310",
                    "option_id": "7073",
                    "code": "turbo_type"
                },
                {
                    "name": "S310C",
                    "option_id": "7082",
                    "code": "turbo_type"
                },
                {
                    "name": "S310CG",
                    "option_id": "6981",
                    "code": "turbo_type"
                },
                {
                    "name": "S310G",
                    "option_id": "545",
                    "code": "turbo_type"
                },
                {
                    "name": "S310S",
                    "option_id": "549",
                    "code": "turbo_type"
                },
                {
                    "name": "S330",
                    "option_id": "546",
                    "code": "turbo_type"
                },
                {
                    "name": "S330GX",
                    "option_id": "7361",
                    "code": "turbo_type"
                },
                {
                    "name": "S330S",
                    "option_id": "547",
                    "code": "turbo_type"
                },
                {
                    "name": "S330W",
                    "option_id": "548",
                    "code": "turbo_type"
                },
                {
                    "name": "S330WG",
                    "option_id": "6748",
                    "code": "turbo_type"
                },
                {
                    "name": "S3A",
                    "option_id": "586",
                    "code": "turbo_type"
                },
                {
                    "name": "S3AC",
                    "option_id": "617",
                    "code": "turbo_type"
                },
                {
                    "name": "S3ALW",
                    "option_id": "6074",
                    "code": "turbo_type"
                },
                {
                    "name": "S3AS",
                    "option_id": "585",
                    "code": "turbo_type"
                },
                {
                    "name": "S3AW",
                    "option_id": "587",
                    "code": "turbo_type"
                },
                {
                    "name": "S3B",
                    "option_id": "523",
                    "code": "turbo_type"
                },
                {
                    "name": "S3BCG",
                    "option_id": "6706",
                    "code": "turbo_type"
                },
                {
                    "name": "S3BG",
                    "option_id": "521",
                    "code": "turbo_type"
                },
                {
                    "name": "S3BGL",
                    "option_id": "522",
                    "code": "turbo_type"
                },
                {
                    "name": "S3BL",
                    "option_id": "520",
                    "code": "turbo_type"
                },
                {
                    "name": "S3BS",
                    "option_id": "519",
                    "code": "turbo_type"
                },
                {
                    "name": "S3BSL",
                    "option_id": "518",
                    "code": "turbo_type"
                },
                {
                    "name": "S3BV",
                    "option_id": "6346",
                    "code": "turbo_type"
                },
                {
                    "name": "S3NG",
                    "option_id": "7363",
                    "code": "turbo_type"
                },
                {
                    "name": "S4",
                    "option_id": "584",
                    "code": "turbo_type"
                },
                {
                    "name": "S400",
                    "option_id": "538",
                    "code": "turbo_type"
                },
                {
                    "name": "S400G",
                    "option_id": "6696",
                    "code": "turbo_type"
                },
                {
                    "name": "S400S",
                    "option_id": "543",
                    "code": "turbo_type"
                },
                {
                    "name": "S400SX",
                    "option_id": "7018",
                    "code": "turbo_type"
                },
                {
                    "name": "S400W",
                    "option_id": "624",
                    "code": "turbo_type"
                },
                {
                    "name": "S410",
                    "option_id": "622",
                    "code": "turbo_type"
                },
                {
                    "name": "S410G",
                    "option_id": "619",
                    "code": "turbo_type"
                },
                {
                    "name": "S410T",
                    "option_id": "621",
                    "code": "turbo_type"
                },
                {
                    "name": "S410V",
                    "option_id": "6922",
                    "code": "turbo_type"
                },
                {
                    "name": "S410W",
                    "option_id": "623",
                    "code": "turbo_type"
                },
                {
                    "name": "S410WG",
                    "option_id": "620",
                    "code": "turbo_type"
                },
                {
                    "name": "S430",
                    "option_id": "7462",
                    "code": "turbo_type"
                },
                {
                    "name": "S430S",
                    "option_id": "7378",
                    "code": "turbo_type"
                },
                {
                    "name": "S430SX",
                    "option_id": "7465",
                    "code": "turbo_type"
                },
                {
                    "name": "S430V",
                    "option_id": "6984",
                    "code": "turbo_type"
                },
                {
                    "name": "S430W",
                    "option_id": "7507",
                    "code": "turbo_type"
                },
                {
                    "name": "S4A",
                    "option_id": "583",
                    "code": "turbo_type"
                },
                {
                    "name": "S4AC",
                    "option_id": "628",
                    "code": "turbo_type"
                },
                {
                    "name": "S4AS",
                    "option_id": "527",
                    "code": "turbo_type"
                },
                {
                    "name": "S4D",
                    "option_id": "517",
                    "code": "turbo_type"
                },
                {
                    "name": "S4DC",
                    "option_id": "627",
                    "code": "turbo_type"
                },
                {
                    "name": "S4DCL",
                    "option_id": "631",
                    "code": "turbo_type"
                },
                {
                    "name": "S4DL",
                    "option_id": "529",
                    "code": "turbo_type"
                },
                {
                    "name": "S4DS",
                    "option_id": "526",
                    "code": "turbo_type"
                },
                {
                    "name": "S4DSL",
                    "option_id": "629",
                    "code": "turbo_type"
                },
                {
                    "name": "S4DW",
                    "option_id": "592",
                    "code": "turbo_type"
                },
                {
                    "name": "S4DWL",
                    "option_id": "525",
                    "code": "turbo_type"
                },
                {
                    "name": "S4EV",
                    "option_id": "7455",
                    "code": "turbo_type"
                },
                {
                    "name": "S4H",
                    "option_id": "630",
                    "code": "turbo_type"
                },
                {
                    "name": "S4T",
                    "option_id": "568",
                    "code": "turbo_type"
                },
                {
                    "name": "S4TC",
                    "option_id": "625",
                    "code": "turbo_type"
                },
                {
                    "name": "S4TS",
                    "option_id": "626",
                    "code": "turbo_type"
                },
                {
                    "name": "S4TW",
                    "option_id": "559",
                    "code": "turbo_type"
                },
                {
                    "name": "S500",
                    "option_id": "604",
                    "code": "turbo_type"
                },
                {
                    "name": "S500C",
                    "option_id": "7009",
                    "code": "turbo_type"
                },
                {
                    "name": "S500R",
                    "option_id": "717",
                    "code": "turbo_type"
                },
                {
                    "name": "S500SX",
                    "option_id": "7259",
                    "code": "turbo_type"
                },
                {
                    "name": "S500W",
                    "option_id": "603",
                    "code": "turbo_type"
                },
                {
                    "name": "S500WG",
                    "option_id": "6890",
                    "code": "turbo_type"
                },
                {
                    "name": "S510",
                    "option_id": "6967",
                    "code": "turbo_type"
                },
                {
                    "name": "S510C",
                    "option_id": "544",
                    "code": "turbo_type"
                },
                {
                    "name": "S510W",
                    "option_id": "7197",
                    "code": "turbo_type"
                },
                {
                    "name": "S65",
                    "option_id": "588",
                    "code": "turbo_type"
                },
                {
                    "name": "S76",
                    "option_id": "533",
                    "code": "turbo_type"
                },
                {
                    "name": "S76A",
                    "option_id": "577",
                    "code": "turbo_type"
                },
                {
                    "name": "S81",
                    "option_id": "590",
                    "code": "turbo_type"
                },
                {
                    "name": "SST32",
                    "option_id": "6562",
                    "code": "turbo_type"
                },
                {
                    "name": "ST50",
                    "option_id": "310",
                    "code": "turbo_type"
                },
                {
                    "name": "T04",
                    "option_id": "6626",
                    "code": "turbo_type"
                },
                {
                    "name": "T04B",
                    "option_id": "307",
                    "code": "turbo_type"
                },
                {
                    "name": "T11",
                    "option_id": "216",
                    "code": "turbo_type"
                },
                {
                    "name": "T12",
                    "option_id": "129",
                    "code": "turbo_type"
                },
                {
                    "name": "T14",
                    "option_id": "210",
                    "code": "turbo_type"
                },
                {
                    "name": "T15",
                    "option_id": "209",
                    "code": "turbo_type"
                },
                {
                    "name": "T16",
                    "option_id": "213",
                    "code": "turbo_type"
                },
                {
                    "name": "T18",
                    "option_id": "130",
                    "code": "turbo_type"
                },
                {
                    "name": "T18A",
                    "option_id": "200",
                    "code": "turbo_type"
                },
                {
                    "name": "T18C",
                    "option_id": "203",
                    "code": "turbo_type"
                },
                {
                    "name": "T19",
                    "option_id": "3616",
                    "code": "turbo_type"
                },
                {
                    "name": "T19A",
                    "option_id": "202",
                    "code": "turbo_type"
                },
                {
                    "name": "T2",
                    "option_id": "140",
                    "code": "turbo_type"
                },
                {
                    "name": "T24",
                    "option_id": "212",
                    "code": "turbo_type"
                },
                {
                    "name": "T25",
                    "option_id": "141",
                    "code": "turbo_type"
                },
                {
                    "name": "T250",
                    "option_id": "155",
                    "code": "turbo_type"
                },
                {
                    "name": "T250-04",
                    "option_id": "693",
                    "code": "turbo_type"
                },
                {
                    "name": "T251",
                    "option_id": "741",
                    "code": "turbo_type"
                },
                {
                    "name": "T25O",
                    "option_id": "164",
                    "code": "turbo_type"
                },
                {
                    "name": "T3",
                    "option_id": "132",
                    "code": "turbo_type"
                },
                {
                    "name": "T30",
                    "option_id": "211",
                    "code": "turbo_type"
                },
                {
                    "name": "T300",
                    "option_id": "170",
                    "code": "turbo_type"
                },
                {
                    "name": "T350",
                    "option_id": "204",
                    "code": "turbo_type"
                },
                {
                    "name": "T3OO",
                    "option_id": "734",
                    "code": "turbo_type"
                },
                {
                    "name": "T4",
                    "option_id": "205",
                    "code": "turbo_type"
                },
                {
                    "name": "T46",
                    "option_id": "311",
                    "code": "turbo_type"
                },
                {
                    "name": "T46B",
                    "option_id": "414",
                    "code": "turbo_type"
                },
                {
                    "name": "T50",
                    "option_id": "415",
                    "code": "turbo_type"
                },
                {
                    "name": "T60",
                    "option_id": "207",
                    "code": "turbo_type"
                },
                {
                    "name": "TA25",
                    "option_id": "161",
                    "code": "turbo_type"
                },
                {
                    "name": "TA3",
                    "option_id": "637",
                    "code": "turbo_type"
                },
                {
                    "name": "TA31",
                    "option_id": "138",
                    "code": "turbo_type"
                },
                {
                    "name": "TA34",
                    "option_id": "147",
                    "code": "turbo_type"
                },
                {
                    "name": "TA35",
                    "option_id": "154",
                    "code": "turbo_type"
                },
                {
                    "name": "TA38",
                    "option_id": "148",
                    "code": "turbo_type"
                },
                {
                    "name": "TA45",
                    "option_id": "217",
                    "code": "turbo_type"
                },
                {
                    "name": "TA48",
                    "option_id": "228",
                    "code": "turbo_type"
                },
                {
                    "name": "TA51",
                    "option_id": "229",
                    "code": "turbo_type"
                },
                {
                    "name": "TA61",
                    "option_id": "6216",
                    "code": "turbo_type"
                },
                {
                    "name": "TA74",
                    "option_id": "180",
                    "code": "turbo_type"
                },
                {
                    "name": "TA75",
                    "option_id": "255",
                    "code": "turbo_type"
                },
                {
                    "name": "TA85",
                    "option_id": "256",
                    "code": "turbo_type"
                },
                {
                    "name": "TAO3",
                    "option_id": "134",
                    "code": "turbo_type"
                },
                {
                    "name": "TAO4",
                    "option_id": "5860",
                    "code": "turbo_type"
                },
                {
                    "name": "TB02",
                    "option_id": "275",
                    "code": "turbo_type"
                },
                {
                    "name": "TB0243",
                    "option_id": "721",
                    "code": "turbo_type"
                },
                {
                    "name": "TB03",
                    "option_id": "243",
                    "code": "turbo_type"
                },
                {
                    "name": "TB15",
                    "option_id": "675",
                    "code": "turbo_type"
                },
                {
                    "name": "TB19",
                    "option_id": "166",
                    "code": "turbo_type"
                },
                {
                    "name": "TB22",
                    "option_id": "165",
                    "code": "turbo_type"
                },
                {
                    "name": "TB25",
                    "option_id": "144",
                    "code": "turbo_type"
                },
                {
                    "name": "TB2509",
                    "option_id": "698",
                    "code": "turbo_type"
                },
                {
                    "name": "TB2520",
                    "option_id": "694",
                    "code": "turbo_type"
                },
                {
                    "name": "TB2529",
                    "option_id": "727",
                    "code": "turbo_type"
                },
                {
                    "name": "TB2531",
                    "option_id": "726",
                    "code": "turbo_type"
                },
                {
                    "name": "TB2534",
                    "option_id": "699",
                    "code": "turbo_type"
                },
                {
                    "name": "TB2538",
                    "option_id": "697",
                    "code": "turbo_type"
                },
                {
                    "name": "TB2549",
                    "option_id": "696",
                    "code": "turbo_type"
                },
                {
                    "name": "TB2555",
                    "option_id": "695",
                    "code": "turbo_type"
                },
                {
                    "name": "TB2559",
                    "option_id": "733",
                    "code": "turbo_type"
                },
                {
                    "name": "TB2560",
                    "option_id": "639",
                    "code": "turbo_type"
                },
                {
                    "name": "TB2566",
                    "option_id": "638",
                    "code": "turbo_type"
                },
                {
                    "name": "TB27",
                    "option_id": "736",
                    "code": "turbo_type"
                },
                {
                    "name": "TB28",
                    "option_id": "143",
                    "code": "turbo_type"
                },
                {
                    "name": "TB2801",
                    "option_id": "701",
                    "code": "turbo_type"
                },
                {
                    "name": "TB2804",
                    "option_id": "705",
                    "code": "turbo_type"
                },
                {
                    "name": "TB2806",
                    "option_id": "704",
                    "code": "turbo_type"
                },
                {
                    "name": "TB2809",
                    "option_id": "702",
                    "code": "turbo_type"
                },
                {
                    "name": "TB2810",
                    "option_id": "640",
                    "code": "turbo_type"
                },
                {
                    "name": "TB2812",
                    "option_id": "703",
                    "code": "turbo_type"
                },
                {
                    "name": "TB2815",
                    "option_id": "700",
                    "code": "turbo_type"
                },
                {
                    "name": "TB31",
                    "option_id": "135",
                    "code": "turbo_type"
                },
                {
                    "name": "TB34",
                    "option_id": "137",
                    "code": "turbo_type"
                },
                {
                    "name": "TB41",
                    "option_id": "153",
                    "code": "turbo_type"
                },
                {
                    "name": "TB45",
                    "option_id": "223",
                    "code": "turbo_type"
                },
                {
                    "name": "TBO2",
                    "option_id": "142",
                    "code": "turbo_type"
                },
                {
                    "name": "TBO210",
                    "option_id": "718",
                    "code": "turbo_type"
                },
                {
                    "name": "TBO214",
                    "option_id": "722",
                    "code": "turbo_type"
                },
                {
                    "name": "TBO228",
                    "option_id": "732",
                    "code": "turbo_type"
                },
                {
                    "name": "TBO232",
                    "option_id": "729",
                    "code": "turbo_type"
                },
                {
                    "name": "TBO234",
                    "option_id": "728",
                    "code": "turbo_type"
                },
                {
                    "name": "TBO242",
                    "option_id": "720",
                    "code": "turbo_type"
                },
                {
                    "name": "TBO245",
                    "option_id": "725",
                    "code": "turbo_type"
                },
                {
                    "name": "TBO249",
                    "option_id": "719",
                    "code": "turbo_type"
                },
                {
                    "name": "TBO25",
                    "option_id": "276",
                    "code": "turbo_type"
                },
                {
                    "name": "TBO250",
                    "option_id": "723",
                    "code": "turbo_type"
                },
                {
                    "name": "TBO255",
                    "option_id": "731",
                    "code": "turbo_type"
                },
                {
                    "name": "TBO262",
                    "option_id": "724",
                    "code": "turbo_type"
                },
                {
                    "name": "TBO277",
                    "option_id": "730",
                    "code": "turbo_type"
                },
                {
                    "name": "TBO3",
                    "option_id": "131",
                    "code": "turbo_type"
                },
                {
                    "name": "TBP4",
                    "option_id": "183",
                    "code": "turbo_type"
                },
                {
                    "name": "TBP45",
                    "option_id": "225",
                    "code": "turbo_type"
                },
                {
                    "name": "TBP48",
                    "option_id": "233",
                    "code": "turbo_type"
                },
                {
                    "name": "TBP75",
                    "option_id": "247",
                    "code": "turbo_type"
                },
                {
                    "name": "TBP7501",
                    "option_id": "751",
                    "code": "turbo_type"
                },
                {
                    "name": "TC15",
                    "option_id": "688",
                    "code": "turbo_type"
                },
                {
                    "name": "TC43",
                    "option_id": "136",
                    "code": "turbo_type"
                },
                {
                    "name": "TC44",
                    "option_id": "149",
                    "code": "turbo_type"
                },
                {
                    "name": "TCO3",
                    "option_id": "133",
                    "code": "turbo_type"
                },
                {
                    "name": "TCO4",
                    "option_id": "499",
                    "code": "turbo_type"
                },
                {
                    "name": "TCO5",
                    "option_id": "497",
                    "code": "turbo_type"
                },
                {
                    "name": "TCO6",
                    "option_id": "498",
                    "code": "turbo_type"
                },
                {
                    "name": "TD04",
                    "option_id": "738",
                    "code": "turbo_type"
                },
                {
                    "name": "TD10",
                    "option_id": "510",
                    "code": "turbo_type"
                },
                {
                    "name": "TD13",
                    "option_id": "511",
                    "code": "turbo_type"
                },
                {
                    "name": "TD15",
                    "option_id": "5815",
                    "code": "turbo_type"
                },
                {
                    "name": "TD25",
                    "option_id": "158",
                    "code": "turbo_type"
                },
                {
                    "name": "TD27",
                    "option_id": "636",
                    "code": "turbo_type"
                },
                {
                    "name": "TD45",
                    "option_id": "220",
                    "code": "turbo_type"
                },
                {
                    "name": "TDO2",
                    "option_id": "716",
                    "code": "turbo_type"
                },
                {
                    "name": "TDO25",
                    "option_id": "673",
                    "code": "turbo_type"
                },
                {
                    "name": "TDO3",
                    "option_id": "672",
                    "code": "turbo_type"
                },
                {
                    "name": "TDO4",
                    "option_id": "504",
                    "code": "turbo_type"
                },
                {
                    "name": "TDO4H",
                    "option_id": "503",
                    "code": "turbo_type"
                },
                {
                    "name": "TDO5",
                    "option_id": "509",
                    "code": "turbo_type"
                },
                {
                    "name": "TDO5H",
                    "option_id": "508",
                    "code": "turbo_type"
                },
                {
                    "name": "TDO6",
                    "option_id": "506",
                    "code": "turbo_type"
                },
                {
                    "name": "TDO7",
                    "option_id": "502",
                    "code": "turbo_type"
                },
                {
                    "name": "TDO7S",
                    "option_id": "513",
                    "code": "turbo_type"
                },
                {
                    "name": "TDO8",
                    "option_id": "501",
                    "code": "turbo_type"
                },
                {
                    "name": "TDO8H",
                    "option_id": "500",
                    "code": "turbo_type"
                },
                {
                    "name": "TDO9",
                    "option_id": "495",
                    "code": "turbo_type"
                },
                {
                    "name": "TE27",
                    "option_id": "163",
                    "code": "turbo_type"
                },
                {
                    "name": "TEO3",
                    "option_id": "5210",
                    "code": "turbo_type"
                },
                {
                    "name": "TEO4H",
                    "option_id": "505",
                    "code": "turbo_type"
                },
                {
                    "name": "TEO5",
                    "option_id": "507",
                    "code": "turbo_type"
                },
                {
                    "name": "TEO6",
                    "option_id": "184",
                    "code": "turbo_type"
                },
                {
                    "name": "TEO6H",
                    "option_id": "512",
                    "code": "turbo_type"
                },
                {
                    "name": "test15f",
                    "option_id": "1575",
                    "code": "turbo_type"
                },
                {
                    "name": "test15j",
                    "option_id": "308",
                    "code": "turbo_type"
                },
                {
                    "name": "TF15",
                    "option_id": "1368",
                    "code": "turbo_type"
                },
                {
                    "name": "TFO35",
                    "option_id": "496",
                    "code": "turbo_type"
                },
                {
                    "name": "TFO7",
                    "option_id": "3315",
                    "code": "turbo_type"
                },
                {
                    "name": "TFO8",
                    "option_id": "689",
                    "code": "turbo_type"
                },
                {
                    "name": "THO8A",
                    "option_id": "206",
                    "code": "turbo_type"
                },
                {
                    "name": "TL18A",
                    "option_id": "201",
                    "code": "turbo_type"
                },
                {
                    "name": "TL61",
                    "option_id": "196",
                    "code": "turbo_type"
                },
                {
                    "name": "TL71",
                    "option_id": "197",
                    "code": "turbo_type"
                },
                {
                    "name": "TL75",
                    "option_id": "245",
                    "code": "turbo_type"
                },
                {
                    "name": "TL77",
                    "option_id": "193",
                    "code": "turbo_type"
                },
                {
                    "name": "TL78",
                    "option_id": "186",
                    "code": "turbo_type"
                },
                {
                    "name": "TL81",
                    "option_id": "179",
                    "code": "turbo_type"
                },
                {
                    "name": "TL83",
                    "option_id": "4595",
                    "code": "turbo_type"
                },
                {
                    "name": "TL91",
                    "option_id": "293",
                    "code": "turbo_type"
                },
                {
                    "name": "TL92",
                    "option_id": "177",
                    "code": "turbo_type"
                },
                {
                    "name": "TM51",
                    "option_id": "227",
                    "code": "turbo_type"
                },
                {
                    "name": "TM54",
                    "option_id": "226",
                    "code": "turbo_type"
                },
                {
                    "name": "TM61",
                    "option_id": "188",
                    "code": "turbo_type"
                },
                {
                    "name": "TMF51",
                    "option_id": "234",
                    "code": "turbo_type"
                },
                {
                    "name": "TMF54",
                    "option_id": "740",
                    "code": "turbo_type"
                },
                {
                    "name": "TMF55",
                    "option_id": "231",
                    "code": "turbo_type"
                },
                {
                    "name": "TMF5503",
                    "option_id": "236",
                    "code": "turbo_type"
                },
                {
                    "name": "TMI51",
                    "option_id": "6619",
                    "code": "turbo_type"
                },
                {
                    "name": "TO4",
                    "option_id": "152",
                    "code": "turbo_type"
                },
                {
                    "name": "TO4B",
                    "option_id": "145",
                    "code": "turbo_type"
                },
                {
                    "name": "TO4B34",
                    "option_id": "420",
                    "code": "turbo_type"
                },
                {
                    "name": "TO4E",
                    "option_id": "182",
                    "code": "turbo_type"
                },
                {
                    "name": "TO4N",
                    "option_id": "739",
                    "code": "turbo_type"
                },
                {
                    "name": "TO4S",
                    "option_id": "292",
                    "code": "turbo_type"
                },
                {
                    "name": "TO5B",
                    "option_id": "139",
                    "code": "turbo_type"
                },
                {
                    "name": "TO6",
                    "option_id": "214",
                    "code": "turbo_type"
                },
                {
                    "name": "TO7",
                    "option_id": "215",
                    "code": "turbo_type"
                },
                {
                    "name": "TP38",
                    "option_id": "281",
                    "code": "turbo_type"
                },
                {
                    "name": "TT55",
                    "option_id": "3527",
                    "code": "turbo_type"
                },
                {
                    "name": "TV",
                    "option_id": "128",
                    "code": "turbo_type"
                },
                {
                    "name": "TV45",
                    "option_id": "235",
                    "code": "turbo_type"
                },
                {
                    "name": "TV48",
                    "option_id": "219",
                    "code": "turbo_type"
                },
                {
                    "name": "TV51",
                    "option_id": "232",
                    "code": "turbo_type"
                },
                {
                    "name": "TV58",
                    "option_id": "222",
                    "code": "turbo_type"
                },
                {
                    "name": "TV60",
                    "option_id": "199",
                    "code": "turbo_type"
                },
                {
                    "name": "TV61",
                    "option_id": "168",
                    "code": "turbo_type"
                },
                {
                    "name": "TV63",
                    "option_id": "252",
                    "code": "turbo_type"
                },
                {
                    "name": "TV65",
                    "option_id": "249",
                    "code": "turbo_type"
                },
                {
                    "name": "TV70",
                    "option_id": "185",
                    "code": "turbo_type"
                },
                {
                    "name": "TV71",
                    "option_id": "169",
                    "code": "turbo_type"
                },
                {
                    "name": "TV72",
                    "option_id": "192",
                    "code": "turbo_type"
                },
                {
                    "name": "TV73",
                    "option_id": "237",
                    "code": "turbo_type"
                },
                {
                    "name": "TV74",
                    "option_id": "246",
                    "code": "turbo_type"
                },
                {
                    "name": "TV75",
                    "option_id": "240",
                    "code": "turbo_type"
                },
                {
                    "name": "TV77",
                    "option_id": "198",
                    "code": "turbo_type"
                },
                {
                    "name": "TV78",
                    "option_id": "191",
                    "code": "turbo_type"
                },
                {
                    "name": "TV81",
                    "option_id": "167",
                    "code": "turbo_type"
                },
                {
                    "name": "TV83",
                    "option_id": "251",
                    "code": "turbo_type"
                },
                {
                    "name": "TV84",
                    "option_id": "241",
                    "code": "turbo_type"
                },
                {
                    "name": "TV85",
                    "option_id": "242",
                    "code": "turbo_type"
                },
                {
                    "name": "TV91",
                    "option_id": "173",
                    "code": "turbo_type"
                },
                {
                    "name": "TV92",
                    "option_id": "178",
                    "code": "turbo_type"
                },
                {
                    "name": "TV94",
                    "option_id": "176",
                    "code": "turbo_type"
                },
                {
                    "name": "TV95",
                    "option_id": "175",
                    "code": "turbo_type"
                },
                {
                    "name": "TW18A",
                    "option_id": "208",
                    "code": "turbo_type"
                },
                {
                    "name": "TW34",
                    "option_id": "1307",
                    "code": "turbo_type"
                },
                {
                    "name": "TW41",
                    "option_id": "151",
                    "code": "turbo_type"
                },
                {
                    "name": "TW4B",
                    "option_id": "150",
                    "code": "turbo_type"
                },
                {
                    "name": "TW4C",
                    "option_id": "146",
                    "code": "turbo_type"
                },
                {
                    "name": "TW4E",
                    "option_id": "181",
                    "code": "turbo_type"
                },
                {
                    "name": "TW51",
                    "option_id": "221",
                    "code": "turbo_type"
                },
                {
                    "name": "TW61",
                    "option_id": "194",
                    "code": "turbo_type"
                },
                {
                    "name": "TW63",
                    "option_id": "250",
                    "code": "turbo_type"
                },
                {
                    "name": "TW72",
                    "option_id": "190",
                    "code": "turbo_type"
                },
                {
                    "name": "TW73",
                    "option_id": "187",
                    "code": "turbo_type"
                },
                {
                    "name": "TW75",
                    "option_id": "253",
                    "code": "turbo_type"
                },
                {
                    "name": "TW78",
                    "option_id": "195",
                    "code": "turbo_type"
                },
                {
                    "name": "TW81",
                    "option_id": "189",
                    "code": "turbo_type"
                },
                {
                    "name": "TW83",
                    "option_id": "248",
                    "code": "turbo_type"
                },
                {
                    "name": "TW84",
                    "option_id": "254",
                    "code": "turbo_type"
                },
                {
                    "name": "TW91",
                    "option_id": "172",
                    "code": "turbo_type"
                },
                {
                    "name": "TW92",
                    "option_id": "174",
                    "code": "turbo_type"
                },
                {
                    "name": "TW94",
                    "option_id": "171",
                    "code": "turbo_type"
                },
                {
                    "name": "Unknown",
                    "option_id": "6630",
                    "code": "turbo_type"
                },
                {
                    "name": "unknown",
                    "option_id": "6637",
                    "code": "turbo_type"
                },
                {
                    "name": "UTL75",
                    "option_id": "1340",
                    "code": "turbo_type"
                },
                {
                    "name": "UTL83",
                    "option_id": "269",
                    "code": "turbo_type"
                },
                {
                    "name": "UTL89",
                    "option_id": "260",
                    "code": "turbo_type"
                },
                {
                    "name": "UTL92",
                    "option_id": "1962",
                    "code": "turbo_type"
                },
                {
                    "name": "UTL94",
                    "option_id": "290",
                    "code": "turbo_type"
                },
                {
                    "name": "UTV71",
                    "option_id": "4073",
                    "code": "turbo_type"
                },
                {
                    "name": "UTV75",
                    "option_id": "257",
                    "code": "turbo_type"
                },
                {
                    "name": "UTV7514",
                    "option_id": "753",
                    "code": "turbo_type"
                },
                {
                    "name": "UTV78",
                    "option_id": "259",
                    "code": "turbo_type"
                },
                {
                    "name": "UTV81",
                    "option_id": "238",
                    "code": "turbo_type"
                },
                {
                    "name": "UTV83",
                    "option_id": "261",
                    "code": "turbo_type"
                },
                {
                    "name": "UTV89",
                    "option_id": "267",
                    "code": "turbo_type"
                },
                {
                    "name": "UTV94",
                    "option_id": "289",
                    "code": "turbo_type"
                },
                {
                    "name": "UTW75",
                    "option_id": "271",
                    "code": "turbo_type"
                },
                {
                    "name": "UTW78",
                    "option_id": "6470",
                    "code": "turbo_type"
                },
                {
                    "name": "UTW83",
                    "option_id": "270",
                    "code": "turbo_type"
                },
                {
                    "name": "UTW85",
                    "option_id": "273",
                    "code": "turbo_type"
                },
                {
                    "name": "UTW88",
                    "option_id": "5299",
                    "code": "turbo_type"
                },
                {
                    "name": "UTW92",
                    "option_id": "1118",
                    "code": "turbo_type"
                },
                {
                    "name": "V2S",
                    "option_id": "7184",
                    "code": "turbo_type"
                },
                {
                    "name": "V4HD",
                    "option_id": "570",
                    "code": "turbo_type"
                },
                {
                    "name": "V4MD",
                    "option_id": "573",
                    "code": "turbo_type"
                },
                {
                    "name": "VAT25",
                    "option_id": "160",
                    "code": "turbo_type"
                },
                {
                    "name": "VNT25",
                    "option_id": "283",
                    "code": "turbo_type"
                },
                {
                    "name": "VT50",
                    "option_id": "312",
                    "code": "turbo_type"
                },
                {
                    "name": "WH1C",
                    "option_id": "352",
                    "code": "turbo_type"
                },
                {
                    "name": "WH1E",
                    "option_id": "355",
                    "code": "turbo_type"
                },
                {
                    "name": "WH2D",
                    "option_id": "316",
                    "code": "turbo_type"
                }
            ]
        },
        {
            "name": "Manufacturer ",
            "code": "manufacturer",
            "type": "int",
            "options": [
                {
                    "name": "",
                    "option_id": "",
                    "code": "manufacturer"
                },
                {
                    "name": "Garrett",
                    "option_id": "35",
                    "code": "manufacturer"
                },
                {
                    "name": "Hitachi",
                    "option_id": "43",
                    "code": "manufacturer"
                },
                {
                    "name": "Holset",
                    "option_id": "36",
                    "code": "manufacturer"
                },
                {
                    "name": "I.H.I.",
                    "option_id": "38",
                    "code": "manufacturer"
                },
                {
                    "name": "KKK",
                    "option_id": "39",
                    "code": "manufacturer"
                },
                {
                    "name": "Komatsu",
                    "option_id": "42",
                    "code": "manufacturer"
                },
                {
                    "name": "Mitsubishi",
                    "option_id": "37",
                    "code": "manufacturer"
                },
                {
                    "name": "Rotomaster",
                    "option_id": "47",
                    "code": "manufacturer"
                },
                {
                    "name": "Schwitzer",
                    "option_id": "40",
                    "code": "manufacturer"
                },
                {
                    "name": "Toyota",
                    "option_id": "41",
                    "code": "manufacturer"
                },
                {
                    "name": "Turbo International",
                    "option_id": "44",
                    "code": "manufacturer"
                }
            ]
        },
        {
            "name": "Part Type",
            "code": "part_type",
            "type": "int",
            "options": [
                {
                    "name": "",
                    "option_id": "",
                    "code": "part_type"
                },
                {
                    "name": "Actuator",
                    "option_id": "8407",
                    "code": "part_type"
                },
                {
                    "name": "Backplate",
                    "option_id": "8405",
                    "code": "part_type"
                },
                {
                    "name": "Bolt Screw",
                    "option_id": "8411",
                    "code": "part_type"
                },
                {
                    "name": "Carbon Seal",
                    "option_id": "8424",
                    "code": "part_type"
                },
                {
                    "name": "Compressor Cover",
                    "option_id": "8408",
                    "code": "part_type"
                },
                {
                    "name": "Fitting",
                    "option_id": "8412",
                    "code": "part_type"
                },
                {
                    "name": "Heatshield",
                    "option_id": "8406",
                    "code": "part_type"
                },
                {
                    "name": "Journal Bearing Spacer",
                    "option_id": "8413",
                    "code": "part_type"
                },
                {
                    "name": "Nut",
                    "option_id": "8414",
                    "code": "part_type"
                },
                {
                    "name": "Pin",
                    "option_id": "8415",
                    "code": "part_type"
                },
                {
                    "name": "Plug",
                    "option_id": "8409",
                    "code": "part_type"
                },
                {
                    "name": "Retaining Ring",
                    "option_id": "8416",
                    "code": "part_type"
                },
                {
                    "name": "Seal Plate",
                    "option_id": "8417",
                    "code": "part_type"
                },
                {
                    "name": "Spring",
                    "option_id": "8418",
                    "code": "part_type"
                },
                {
                    "name": "Thrust Bearing",
                    "option_id": "8419",
                    "code": "part_type"
                },
                {
                    "name": "Thrust Collar",
                    "option_id": "8420",
                    "code": "part_type"
                },
                {
                    "name": "Thrust Spacer",
                    "option_id": "8421",
                    "code": "part_type"
                },
                {
                    "name": "Thrust Washer",
                    "option_id": "8422",
                    "code": "part_type"
                },
                {
                    "name": "Turbine Housing",
                    "option_id": "8410",
                    "code": "part_type"
                },
                {
                    "name": "Washer",
                    "option_id": "8423",
                    "code": "part_type"
                },
                {
                    "name": "Backplate \/ Sealplate",
                    "option_id": "70",
                    "code": "part_type"
                },
                {
                    "name": "Bearing Housing",
                    "option_id": "69",
                    "code": "part_type"
                },
                {
                    "name": "Bearing Spacer",
                    "option_id": "6613",
                    "code": "part_type"
                },
                {
                    "name": "Cartridge",
                    "option_id": "6609",
                    "code": "part_type"
                },
                {
                    "name": "Clamp",
                    "option_id": "88",
                    "code": "part_type"
                },
                {
                    "name": "Compressor Wheel",
                    "option_id": "68",
                    "code": "part_type"
                },
                {
                    "name": "Gasket",
                    "option_id": "6612",
                    "code": "part_type"
                },
                {
                    "name": "Heatshield \/ Shroud",
                    "option_id": "71",
                    "code": "part_type"
                },
                {
                    "name": "Journal Bearing",
                    "option_id": "6614",
                    "code": "part_type"
                },
                {
                    "name": "Kit",
                    "option_id": "6611",
                    "code": "part_type"
                },
                {
                    "name": "Miscellaneous Minor Components",
                    "option_id": "85",
                    "code": "part_type"
                },
                {
                    "name": "Nozzle Ring",
                    "option_id": "72",
                    "code": "part_type"
                },
                {
                    "name": "O Ring",
                    "option_id": "87",
                    "code": "part_type"
                },
                {
                    "name": "Oil Deflector",
                    "option_id": "89",
                    "code": "part_type"
                },
                {
                    "name": "Piston Ring",
                    "option_id": "6615",
                    "code": "part_type"
                },
                {
                    "name": "Thrust Parts",
                    "option_id": "86",
                    "code": "part_type"
                },
                {
                    "name": "Turbine Wheel",
                    "option_id": "67",
                    "code": "part_type"
                },
                {
                    "name": "Turbo",
                    "option_id": "6610",
                    "code": "part_type"
                }
            ]
        }
    ]
  end

end