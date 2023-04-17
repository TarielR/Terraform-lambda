import json


def run(event, context):
    # Create Dictionary
    value = {
        "org":           "Disney",
        "transactionId": "12345",
        "hobbies": ["playing", "problem solving", "coding"],
        "persons": [
            {
                "firstName": "Sheldon",
                "lastName":  "Cooper",
                "personId":  25,
                "degree":    "Doctor"
            },
            {
                "firstName": "Leonard",
                "lastName":  "Hofstadter",
                "personId":  18,
                "degree":    "Doctor"
            },
            {
                "firstName": "Rajesh",
                "lastName":  "Koothrappali",
                "personId":  543456,
                "degree":    "Doctor"
            },
            {
                "firstName": "Howard",
                "lastName":  "Wolowitz",
                "personId":  234,
                "degree":    "Engineer"
            }
        ]
    }

    # Dictionary to JSON Object using dumps() method
    # Return JSON Object
    return {
        "statusCode": 200,
        "headers": {
            "Content-Type": "application/json"
        },
        "body": json.dumps(value)
    }
