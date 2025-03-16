from appwrite.client import Client
from appwrite.services.databases import Databases

client = Client()
client.set_endpoint("http://localhost/v1")  # Replace with your endpoint
client.set_project("community-app")  # Replace with your project ID
client.set_key("standard_696762be84706c11c6559bc88bd84dd6b1862d396360e53dc26e339ca042828e34b8e93945dc65e0824f92fb938056a4e32a46e9d42d8d4c81869d9e8b84be93e63e087e784ad8543e941a6c10cf2956e8307f747d6a8f2b95ed0844f1fe4f324212f6c017953d8b7adb447bd62c4fe7ff65583ac94454f9d10a7e7d84552707")  # Replace with your API Key

databases = Databases(client)

# Fetch collections
db_id = "communitydb"  # Ensure this is correct
collections = databases.list_collections(db_id)
print(collections)
