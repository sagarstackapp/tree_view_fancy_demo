import 'dart:convert';

const List<Map<String, dynamic>> US_STATES = [
  {
    "label": "A",
    "parent": "true",
    "children": [
      {
        "label": "Alabama",
        "key": "AL",
        "secondFloor": "true",
        "children": [
          {
            "label": "Alaska1",
            "key": "AK1",
            "thirdFloor": "true",
            "children": [
              {
                "label": "California",
                "key": "CA",
                "children": [
                  {
                    "label": "California",
                    "key": "CA10",
                    "children": [
                      {
                        "label": "California",
                        "key": "CA110",
                        "children": [
                          {
                            "label": "California",
                            "key": "CA1110",
                            "children": [
                              {
                                "label": "California",
                                "key": "CA11110",
                                "children": [
                                  {
                                    "label": "California",
                                    "key": "CA111110",
                                    "children": [
                                      {
                                        "label": "California",
                                        "key": "CA1111s1"
                                      },
                                      {"label": "Colorado", "key": "CO1111s1"},
                                      {
                                        "label": "Connecticut",
                                        "key": "CT1111s1"
                                      },
                                    ]
                                  },
                                ]
                              },
                            ]
                          },
                        ]
                      },
                    ]
                  },
                  // {
                  //   "label": "Colorado",
                  //   "key": "CO20",
                  //   "children": [
                  //     {"label": "California", "key": "CA12"},
                  //     {"label": "Colorado", "key": "CO12"},
                  //     {"label": "Connecticut", "key": "CT12"},
                  //   ]
                  // },
                  // {
                  //   "label": "Connecticut",
                  //   "key": "CT30",
                  //   "children": [
                  //     {"label": "California", "key": "CA13"},
                  //     {"label": "Colorado", "key": "CO13"},
                  //     {"label": "Connecticut", "key": "CT13"},
                  //   ]
                  // },
                ]
              },
              // {"label": "Colorado", "key": "CO"},
              // {"label": "Connecticut", "key": "CT"},
            ]
          },
        ]
      },
      {
        "label": "Alaska",
        "key": "AK",
        "secondFloor": "true",
        "children": [
          {"label": "Massachusetts", "key": "MA"},
          {"label": "Michigan", "key": "MI"},
          {"label": "Minnesota", "key": "MN"},
          {"label": "Mississippi", "key": "MS"},
          {"label": "Missouri", "key": "MO"},
          {"label": "Montana", "key": "MT"},
        ]
      },
      {
        "label": "Arizona",
        "key": "AZ",
        "secondFloor": "true",
        "children": [
          {
            "label": "Federated States Of Micronesia",
            "key": "FM",
            "thirdFloor": "true",
            "children": [
              {"label": "Georgia", "key": "GA"},
              {"label": "Guam", "key": "GU"},
            ]
          },
        ]
      },
    ]
  },
  {
    "label": "D",
    "parent": "true",
    "children": [
      {
        "label": "Delaware",
        "key": "DE",
        "secondFloor": "true",
        "children": [
          {"label": "Louisiana", "key": "LA"},
          {"label": "Maine", "key": "ME"},
          {"label": "Marshall Islands", "key": "MH"},
          {"label": "Maryland", "key": "MD"},
        ]
      },
    ]
  },
];

String usStatesJson = jsonEncode(US_STATES);
