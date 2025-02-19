import requests

# Appwrite API configuration
endpoint = 'http://localhost/v1'
project_id = '67b46229000ca4f9a191'
api_key = 'standard_74510254ebd6dd0a633548b83b0acc9b102549779baf6feaf5fa9d6a2eda4620f3771fc3d7523c03819fe22d41d84348793f7a7e5aa69aa4a78aa74e8d0724b83747766f6b1af74771c91b111142027e6265512019fa6235a5ce1b699504972bec1ccc55ea38db08302e222841183750c38f71abb6bb3e9792f235183a6d3b80'
database_id = 'communitydb'


headers = {
    'Content-Type': 'application/json',
    'X-Appwrite-Project': project_id,
    'X-Appwrite-Key': api_key
}


def create_collection(name, collection_id, permissions=None):
    url = f'{endpoint}/databases/{database_id}/collections'
    data = {
        'collectionId': collection_id,
        'name': name,
        'permissions': permissions if permissions else {'read': [], 'write': []}
    }
    response = requests.post(url, headers=headers, json=data)
    return response.json()


def create_string_attribute(collection_id, key, size, required=False, default=None):
    url = f'{endpoint}/databases/{database_id}/collections/{collection_id}/attributes/string'
    data = {
        'key': key,
        'size': size,
        'required': required,
        'default': default
    }
    response = requests.post(url, headers=headers, json=data)
    return response.json()


def create_datetime_attribute(collection_id, key, required=False, default=None):
    url = f'{endpoint}/databases/{database_id}/collections/{collection_id}/attributes/datetime'
    data = {
        'key': key,
        'required': required,
        'default': default
    }
    response = requests.post(url, headers=headers, json=data)
    return response.json()


def create_integer_attribute(collection_id, key, required=False, min_val=None, max_val=None, default=None):
    url = f'{endpoint}/databases/{database_id}/collections/{collection_id}/attributes/integer'
    data = {
        'key': key,
        'required': required,
        'min': min_val,
        'max': max_val,
        'default': default
    }
    response = requests.post(url, headers=headers, json=data)
    return response.json()


def create_attribute(collection_id, attribute_config):
    attr_type = attribute_config['type']
    key = attribute_config['key']
    required = attribute_config.get('required', False)
    default = attribute_config.get('default')

    if attr_type == 'string':
        size = attribute_config['size']
        return create_string_attribute(collection_id, key, size, required, default)
    elif attr_type == 'datetime':
        return create_datetime_attribute(collection_id, key, required, default)
    elif attr_type == 'integer':
        min_val = attribute_config.get('min')
        max_val = attribute_config.get('max')
        return create_integer_attribute(collection_id, key, required, min_val, max_val, default)
    else:
        raise ValueError(f"Unsupported attribute type: {attr_type}")

# Configuration for collections and attributes
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
            {'type': 'date', 'key': 'date', 'size': 25, 'required': True},
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
            {'type': 'string', 'key': 'imageUrl', 'size': 255},
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
            {'type': 'string', 'key': 'postId', 'size': 255, 'required': True}
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


for collection in collections_config:
    print(f"Creating collection: {collection['name']}")
    collection_response = create_collection(collection['name'], collection['collection_id'])
    print(collection_response)

    if 'errors' not in collection_response:
        for attribute in collection['attributes']:
            print(f"Creating attribute: {attribute['key']} in collection: {collection['name']}")
            attribute_response = create_attribute(collection['collection_id'], attribute)
            print(attribute_response)
    else:
        print(f"Error creating collection {collection['name']}: {collection_response['errors']}")