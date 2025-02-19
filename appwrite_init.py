from appwrite.client import Client
from appwrite.services.users import Users
from dotenv import load_dotenv
from appwrite.exception import AppwriteException
from appwrite.services.databases import Databases
import os

load_dotenv()

# http://localhost/v1
endpoint = os.getenv('APPWRITE_URL')
project_id = os.getenv('APPWRITE_PROJECT_ID')
api_key = os.getenv('APPWRITE_API_KEY')
db_id = os.getenv('APPWRITE_DATABASE_ID')

client = Client()

(client
    .set_endpoint(endpoint)
    .set_project(project_id)
    .set_key(api_key)
    # .set_self_signed() # Use only on dev mode with a self-signed SSL cert
    )

collections_config = [
    #Events
    {
        'name': 'Events',
        'collection_id': 'events',
        'attributes': [
            {'type': 'string', 'key': 'title_en', 'size': 255, 'required': True},
            {'type': 'string', 'key': 'title_fi', 'size': 255},
            {'type': 'string', 'key': 'title_sv', 'size': 255},
            {'type': 'string', 'key': 'location_en', 'size': 255},
            {'type': 'string', 'key': 'location_fi', 'size': 255},
            {'type': 'string', 'key': 'location_sv', 'size': 255},
            {'type': 'datetime', 'key': 'date', 'size': 25, 'required': True},
            {'type': 'string', 'key': 'time', 'size': 25, 'required': True},
            {'type': 'string', 'key': 'organizerName', 'size': 255},
            {'type': 'string', 'key': 'details_en', 'size': 1024},
            {'type': 'string', 'key': 'details_fi', 'size': 1024},
            {'type': 'string', 'key': 'details_sv', 'size': 1024},
            {'type': 'string', 'key': 'ticketDetails_en', 'size': 1024},
            {'type': 'string', 'key': 'ticketDetails_fi', 'size': 1024},
            {'type': 'string', 'key': 'ticketDetails_sv', 'size': 1024},
            {'type': 'string', 'key': 'locationUrl', 'size': 255},
            {'type': 'string', 'key': 'price', 'size': 25},
            {'type': 'string', 'key': 'posterPhotoUrl', 'size': 255, 'required': True},
            {'type': 'string', 'key': 'topics', 'size': 255, 'required': True},
            {'type': 'datetime', 'key': 'updatedAt'}
        ]
    },
    #Topics
    {
        'name': 'Topics',
        'collection_id': 'topics',
        'attributes': [
            {'type': 'string', 'key': 'text_en', 'size': 255, 'required': True},
            {'type': 'string', 'key': 'text_fi', 'size': 255, 'required': True},
            {'type': 'string', 'key': 'text_sv', 'size': 255, 'required': True},
            {'type': 'string', 'key': 'icon', 'size': 1024, 'required': True}
        ]
    },
    # Posts
    {
        'name': 'Posts',
        'collection_id': 'posts',
        'attributes': [
            {'type': 'string', 'key': 'postTitle', 'size': 255, 'required': True},
            {'type': 'string', 'key': 'content', 'size': 1024, 'required': True},
            {'type': 'string', 'key': 'imageUrl', 'size': 255,},
            {'type': 'string', 'key': 'authorName', 'size': 255, 'required': True},
            {'type': 'string', 'key': 'authorTitle', 'size': 255, 'required': True},
            {'type': 'datetime', 'key': 'createdAt', 'required': True}
        ]
    },
    # Comments
    {
        'name': 'Comments',
        'collection_id': 'comments',
        'attributes': [
            {'type': 'string', 'key': 'text', 'size': 1024, 'required': True},
            {'type': 'string', 'key': 'username', 'size': 255, 'required': True},
            {'type': 'datetime', 'key': 'dateTime', 'required': True},
            {'type': 'relationship', 'related_collection': 'posts', "relationship_type": "manyToOne", "two_way": False, 'key': 'postId', "on_delete": "cascade"}
        ]
    },
    # announcements
    {
        'name': 'Announcements',
        'collection_id': 'announcements',
        'attributes': [
            {'type': 'string', 'key': 'title', 'size': 255, 'required': True},
            {'type': 'string', 'key': 'content', 'size': 1024, 'required': True},
            {'type': 'datetime', 'key': 'date', 'required': True}
        ]
    }
]
    
def create_database(databases: Databases, db_id):
    print('Creating database', db_id)
    try:
        databases.get(db_id)
    except AppwriteException as e:
        # Database does not exist, create it
        result = databases.create(db_id, 'Community app database')
        print(result)
    
def create_collections(collections_config, databases: Databases, db_id):
    for collection in collections_config:
        print(f"Creating collection: {collection['name']}")
        result = databases.create_collection(db_id, collection['collection_id'], collection['name'])
        print(result)
        
        for attribute in collection['attributes']:
            # If not specified, set required to False
            required = attribute.get('required', False)
            two_way_key = attribute.get('two_way_key', None)
            if attribute['type'] == 'string':
                result = databases.create_string_attribute(db_id, collection['collection_id'], attribute['key'], attribute['size'], required)
            elif attribute['type'] == 'datetime':
                result = databases.create_datetime_attribute(db_id, collection['collection_id'], attribute['key'], required)
            elif attribute['type'] == 'integer':
                result = databases.create_integer_attribute(db_id, collection['collection_id'], attribute['key'], required)
            elif attribute['type'] == 'relationship':
                result = databases.create_relationship_attribute(db_id, collection['collection_id'], attribute['related_collection'], attribute['relationship_type'], attribute['two_way'], two_way_key, attribute['on_delete'])
            else:
                raise ValueError(f'Unknown attribute type: {attribute["type"]}')
    
try:
    databases = Databases(client)
    create_database(databases, db_id)
    create_collections(collections_config, databases, db_id)
except AppwriteException as e:
    print("Exception: ", e.message)
    
