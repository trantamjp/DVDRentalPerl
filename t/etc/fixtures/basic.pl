[
    Country => [
        [ "country_id", "country",       "last_update" ],
        [ 39,           "Greece",        "2006-02-15 09:44:00" ],
        [ 46,           "Iran",          "2006-02-15 09:44:00" ],
        [ 50,           "Japan",         "2006-02-15 09:44:00" ],
        [ 64,           "Myanmar",       "2006-02-15 09:44:00" ],
        [ 68,           "New Zealand",   "2006-02-15 09:44:00" ],
        [ 71,           "Oman",          "2006-02-15 09:44:00" ],
        [ 92,           "Taiwan",        "2006-02-15 09:44:00" ],
        [ 103,          "United States", "2006-02-15 09:44:00" ],
        [ 108,          "Yugoslavia",    "2006-02-15 09:44:00" ],
    ],
    City => [
        [ "city_id", "city",           "country_id", "last_update" ],
        [ 38,        "Athenai",        39,           "2006-02-15 09:45:25" ],
        [ 162,       "Esfahan",        46,           "2006-02-15 09:45:25" ],
        [ 200,       "Hamilton",       68,           "2006-02-15 09:45:25" ],
        [ 280,       "Kragujevac",     108,          "2006-02-15 09:45:25" ],
        [ 295,       "Laredo",         103,          "2006-02-15 09:45:25" ],
        [ 329,       "Masqat",         71,           "2006-02-15 09:45:25" ],
        [ 349,       "Myingyan",       64,           "2006-02-15 09:45:25" ],
        [ 361,       "Nantou",         92,           "2006-02-15 09:45:25" ],
        [ 449,       "San Bernardino", 103,          "2006-02-15 09:45:25" ],
        [ 463,       "Sasebo",         50,           "2006-02-15 09:45:25" ],
    ],
    Address => [ [
            "address_id", "address",     "address2", "district",
            "city_id",    "postal_code", "phone",    "last_update"
        ],
        [ 5, "1913 Hanoi Way", "", "Nagasaki", 463, "35200", "28303384290", "2006-02-15 09:45:30" ],
        [
            6,   "1121 Loja Avenue", "",             "California",
            449, "17886",            "838635286649", "2006-02-15 09:45:30"
        ],
        [
            7, "692 Joliet Street", "", "Attika", 38, "83579", "448477190408",
            "2006-02-15 09:45:30"
        ],
        [
            8, "1566 Inegl Manor",
            "", "Mandalay", 349, "53561", "705814003527", "2006-02-15 09:45:30"
        ],
        [ 9, "53 Idfu Parkway", "", "Nantou", 361, "42399", "10655648674", "2006-02-15 09:45:30" ],
        [
            10, "1795 Santiago de Compostela Way",
            "", "Texas", 295, "18743", "860452626434", "2006-02-15 09:45:30"
        ],
        [
            11, "900 Santiago de Compostela Parkway",
            "", "Central Serbia",
            280, "93896", "716571220373", "2006-02-15 09:45:30"
        ],
        [
            12, "478 Joliet Way",
            "", "Hamilton", 200, "77948", "657282285970", "2006-02-15 09:45:30"
        ],
        [
            13, "613 Korolev Drive",
            "", "Masqat", 329, "45844", "380657522649", "2006-02-15 09:45:30"
        ],
        [
            14, "1531 Sal Drive", "", "Esfahan", 162, "53628", "648856936185",
            "2006-02-15 09:45:30"
        ],
    ],
    Customer => [ [
            "customer_id", "store_id",   "first_name", "last_name",
            "email",       "address_id", "activebool", "create_date",
            "last_update", "active"
        ],
        [
            1, 1, "Mary",       "Smith",                   "mary.smith\@sakilacustomer.org",
            5, 1, "2006-02-14", "2013-05-26 14:49:45.738", 1
        ],
        [
            2, 1, "Patricia",   "Johnson",                 "patricia.johnson\@sakilacustomer.org",
            6, 1, "2006-02-14", "2013-05-26 14:49:45.738", 1
        ],
        [
            3, 1, "Linda",      "Williams",                "linda.williams\@sakilacustomer.org",
            7, 1, "2006-02-14", "2013-05-26 14:49:45.738", 1
        ],
        [
            4, 2, "Barbara",    "Jones",                   "barbara.jones\@sakilacustomer.org",
            8, 1, "2006-02-14", "2013-05-26 14:49:45.738", 1
        ],
        [
            5, 1, "Elizabeth",  "Brown",                   "elizabeth.brown\@sakilacustomer.org",
            9, 1, "2006-02-14", "2013-05-26 14:49:45.738", 1
        ],
        [
            6,  2, "Jennifer",   "Davis",                   "jennifer.davis\@sakilacustomer.org",
            10, 1, "2006-02-14", "2013-05-26 14:49:45.738", 1
        ],
        [
            7,  1, "Maria",      "Miller",                  "maria.miller\@sakilacustomer.org",
            11, 1, "2006-02-14", "2013-05-26 14:49:45.738", 1
        ],
        [
            8,  2, "Susan",      "Wilson",                  "susan.wilson\@sakilacustomer.org",
            12, 1, "2006-02-14", "2013-05-26 14:49:45.738", 1
        ],
        [
            9,  2, "Margaret",   "Moore",                   "margaret.moore\@sakilacustomer.org",
            13, 1, "2006-02-14", "2013-05-26 14:49:45.738", 1
        ],
        [
            10, 1, "Dorothy",    "Taylor",                  "dorothy.taylor\@sakilacustomer.org",
            14, 1, "2006-02-14", "2013-05-26 14:49:45.738", 1
        ],
    ],
]
