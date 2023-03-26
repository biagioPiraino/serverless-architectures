from datetime import datetime
import json, boto3

def lambda_handler(event, context):
  # Print the event structure
  print(event)

  # Define values to return
  response_body: dict
  status: int
  headers = {
    'Content-Type': 'application/json',
    'Access-Control-Allow-Origin': '*'
  }

  try:
    # Get the service resource
    dynamodb = boto3.resource('dynamodb')
    # Get the dynamo db table
    table = dynamodb.Table("api_requests")

    """
      We are expecting only two defined types of requests.
      A GET request that will returns all the entries in the table.
      A POST request that will add an entry to the table.
    """
    if (event["httpMethod"] == "GET"):
      response      = table.scan()
      items         = response['Items']
      response_body = {"items": items}
    else:
      timestamp = str(datetime.now())
      table.put_item(
        Item={
          "request_key" : f'{event["pathParameters"]["user"]}-{timestamp}',
          "resource"    : event["resource"],
          "path"        : event["path"],
          "user"        : event["pathParameters"]["user"],
          "date_added"  : timestamp
        }
      )
      response_body = {"message": "Item added correctly."}

    status = 200
  except Exception as err:
    status = 400
    response_body = {"message": f"An {type(err)} exception has been raised."}

  response = {
    "statusCode" : status,
    "headers"    : headers,
    "body"       : json.dumps(response_body)
  }

  return response