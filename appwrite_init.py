from appwrite.client import Client
from dotenv import load_dotenv
from appwrite.exception import AppwriteException
from appwrite.services.databases import Databases
from datetime import datetime, timedelta
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

sample_topics = [
    {
        "text_en": "Academic",
        "text_fi": "Akateeminen",
        "text_sv": "Akademisk",
        "icon": "📚"
    },
    {
        "text_en": "Student Life",
        "text_fi": "Opiskelijaelämä",
        "text_sv": "Studentliv",
        "icon": "🎓"
    },
    {
        "text_en": "Sports",
        "text_fi": "Urheilu",
        "text_sv": "Sport",
        "icon": "🏃"
    },
    {
        "text_en": "Culture",
        "text_fi": "Kulttuuri",
        "text_sv": "Kultur",
        "icon": "🎭"
    },
    {
        "text_en": "Career",
        "text_fi": "Ura",
        "text_sv": "Karriär",
        "icon": "💼"
    },
    {
        "text_en": "Research",
        "text_fi": "Tutkimus",
        "text_sv": "Forskning",
        "icon": "🔬"
    }
]

sample_posts = [
    {
        "postTitle": "Welcome to the Academic Year 2025-2026!",
        "content": "Dear students and staff, we're excited to start another academic year at the University of Oulu! This year brings many new opportunities and exciting developments in our academic community.",
        "imageUrl": "https://images.unsplash.com/photo-1564981797816-1043664bf78d?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        "authorName": "Prof. Anna Virtanen",
        "authorTitle": "Vice Rector for Education",
        "pollOptions": ", ".join(["Option 1", "Option 2", "Option 3"]),
        "pollResult": "",  # This can be updated with the selected option or vote count
        "createdAt": datetime.now().isoformat()
    },
    {
        "postTitle": "New Student Technology Hub Opening",
        "content": "We're thrilled to announce the opening of our new Student Technology Hub at Linnanmaa Campus! The hub offers state-of-the-art equipment and spaces for project work, coding, and digital content creation.",
        "imageUrl": "https://images.unsplash.com/photo-1564981797816-1043664bf78d?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        "authorName": "Dr. Mikko Järvinen",
        "authorTitle": "Head of IT Services",
        "pollOptions": ", ".join(["Option 1", "Option 2", "Option 3"]),
        "pollResult": "",  # This can be updated with the selected option or vote count
        "createdAt": (datetime.now() - timedelta(days=2)).isoformat()
    },
    {
        "postTitle": "International Student Ambassador Program Launch",
        "content": "Join our new International Student Ambassador program! Help welcome new international students and promote cultural exchange on campus. Applications are now open for the spring semester.",
        "imageUrl": "https://images.unsplash.com/photo-1564981797816-1043664bf78d?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        "authorName": "Lisa Chen",
        "authorTitle": "International Student Coordinator",
        "pollOptions": ", ".join(["Option 1", "Option 2", "Option 3"]),
        "pollResult": "",  # This can be updated with the selected option or vote count
        "createdAt": (datetime.now() - timedelta(days=5)).isoformat()
    }
]

sample_events = [
    {
        "title_en": "Introduction to University Studies",
        "title_fi": "Johdatus yliopisto-opintoihin",
        "title_sv": "Introduktion till universitetsstudier",
        "location_en": "Linnanmaa Campus, Room L2",
        "location_fi": "Linnanmaan kampus, Sali L2",
        "location_sv": "Linnanmaa campus, Sal L2",
        "date": (datetime.now() + timedelta(days=7)).isoformat(),
        "time": "10:00",
        "organizerName": "Student Services",
        "details_en": "Welcome event for new students! Get to know your university and fellow students.",
        "details_fi": "Tervetulotilaisuus uusille opiskelijoille! Tutustu yliopistoosi ja opiskelijatovereihisi.",
        "details_sv": "Välkomstevenemang för nya studenter! Lär känna ditt universitet och dina medstudenter.",
        "ticketDetails_en": "Free for all new students",
        "ticketDetails_fi": "Ilmainen kaikille uusille opiskelijoille",
        "ticketDetails_sv": "Gratis för alla nya studenter",
        "locationUrl": "https://maps.app.goo.gl/LinnanmaaCampus",
        "price": "Free",
        "posterPhotoUrl": "https://images.unsplash.com/photo-1564981797816-1043664bf78d?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        "topics": "Academic, Student Life",
        "updatedAt": datetime.now().isoformat()
    },
    {
        "title_en": "Research Seminar: AI in Healthcare",
        "title_fi": "Tutkimusseminaari: Tekoäly terveydenhuollossa",
        "title_sv": "Forskningsseminarium: AI inom hälsovården",
        "location_en": "Kontinkangas Campus, Medical Faculty",
        "location_fi": "Kontinkankaan kampus, Lääketieteellinen tiedekunta",
        "location_sv": "Kontinkangas campus, Medicinska fakulteten",
        "date": (datetime.now() + timedelta(days=14)).isoformat(),
        "time": "13:15",
        "organizerName": "Faculty of Medicine",
        "details_en": "International research seminar discussing the latest developments in AI applications in healthcare.",
        "details_fi": "Kansainvälinen tutkimusseminaari tekoälyn sovelluksista terveydenhuollossa.",
        "details_sv": "Internationellt forskningsseminarium om AI-tillämpningar inom hälsovården.",
        "ticketDetails_en": "Registration required",
        "ticketDetails_fi": "Ennakkoilmoittautuminen vaaditaan",
        "ticketDetails_sv": "Förhandsregistrering krävs",
        "locationUrl": "https://maps.app.goo.gl/KontinkangasCampus",
        "price": "Free",
        "posterPhotoUrl": "https://images.unsplash.com/photo-1564981797816-1043664bf78d?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        "topics": "Research, Academic",
        "updatedAt": datetime.now().isoformat()
    },
    {
        "title_en": "Student Sports Day",
        "title_fi": "Opiskelijoiden liikuntapäivä",
        "title_sv": "Studerandes idrottsdag",
        "location_en": "Sports Center",
        "location_fi": "Liikuntakeskus",
        "location_sv": "Idrottscenter",
        "date": (datetime.now() + timedelta(days=21)).isoformat(),
        "time": "12:00",
        "organizerName": "Student Sports Society",
        "details_en": "Join us for a day of sports activities! Try different sports and meet new people.",
        "details_fi": "Tule mukaan liikuntapäivään! Kokeile eri lajeja ja tapaa uusia ihmisiä.",
        "details_sv": "Kom med på idrottsdagen! Prova olika sporter och träffa nya människor.",
        "ticketDetails_en": "Student card required",
        "ticketDetails_fi": "Opiskelijakortti vaaditaan",
        "ticketDetails_sv": "Studentkort krävs",
        "locationUrl": "https://maps.app.goo.gl/SportsCenterOulu",
        "price": "5€",
        "posterPhotoUrl": "https://images.unsplash.com/photo-1564981797816-1043664bf78d?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        "topics": "Sports, Student Life",
        "updatedAt": datetime.now().isoformat()
    }
]



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
    # Event likes
    # Appwrite does not support unique indexes on relationship types as of early 2025 so we have to use a stringtype for identifiers
    {
        'name': 'EventLikes',
        'collection_id': 'event_likes',
        'attributes': [
            {'type': 'string', 'key': 'eventId', 'size': 255, 'required': True},
            {'type': 'string', 'key': 'username', 'size': 255, 'required': True}
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
            {'type': 'string', 'key': 'pollOptions', 'size': 1024},  # Store poll options as a string array
            {'type': 'string', 'key': 'pollResult', 'size': 1024},    # Optional: Store the selected poll result or vote count
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

def create_event_like_index():
    try:
        print("Creating unique index for event likes...")
        result = databases.create_index(
            db_id,
            'event_likes',
            'eventId_username_index',
            'unique',
            ['eventId', 'username']
        )
        print(result)
    except AppwriteException as e:
        print(f"Error creating event like index: {str(e)}")

def create_sample_posts():
    try:
        print("Creating sample posts...")
        for post in sample_posts:
            post_data = {
                "postTitle": post['postTitle'],
                "content": post['content'],
                "authorName": post['authorName'],
                "authorTitle": post['authorTitle'],
                "createdAt": post['createdAt'],
                "pollOptions": post.get('pollOptions', []),  # Ensure poll options are included
                "pollResult": post.get('pollResult', ''),    # Optional: Add poll result field
            }
            print(f"Creating post with data: {post_data}") 
            result = databases.create_document(
                db_id,
                'posts',
                'unique()',  # Auto-generate a unique ID
                post_data
            )
            print(f"Created post: {result['postTitle']}")
                
    except AppwriteException as e:
        print(f"Error creating posts: {str(e)}")

        

def create_comments():
    # Get all posts from the database and create comments for each post
    try:
        posts = databases.list_documents(db_id, 'posts')
    except AppwriteException as e:
        print(f"Error getting posts: {str(e)}")
    for post in posts['documents']:
        sample_comments = [
            {
                "text": f"Great post about {post['postTitle'].lower()}!",
                "username": "student2025",
                "dateTime": datetime.now().isoformat(),
                "postId": post['$id']

            },
            {
                "text": "Thanks for sharing this information.",
                "username": "academicstaff",
                "dateTime": (datetime.now() - timedelta(hours=2)).isoformat(),
                "postId": post['$id']
            }
        ]
        
        try:
            # Create comments for the post
            for comment in sample_comments:
                comment_result = databases.create_document(
                    db_id,
                    'comments',
                    'unique()',
                    comment
                )
                print(f"Created comment for post: {post['postTitle']}")
        except AppwriteException as e:
            print(f"Error creating comments: {str(e)}")
                

def create_sample_events():
    try:
        print("Creating sample events...")
        for event in sample_events:
            result = databases.create_document(
                db_id,
                'events',
                'unique()',
                event
            )
            print(f"Created event: {result['title_en']}")
    except AppwriteException as e:
        print(f"Error creating events: {str(e)}")
        
def create_sample_topics():
    try:
        print("Creating sample topics...")
        for topic in sample_topics:
            topic_id = topic['text_en'].lower().replace(' ', '-')
            try:
                databases.get_document(db_id, 'topics', topic_id)
                print(f"Topic {topic['text_en']} already exists")
                continue
            except AppwriteException as e:
                result = databases.create_document(
                    db_id,
                    'topics',
                    topic_id,
                    topic
                )
                print(f"Created topic: {result['text_en']}")
                
    except AppwriteException as e:
        print(f"Error creating topics: {str(e)}")
    
def create_database(databases: Databases):
    print('Creating database', db_id)
    try:
        databases.get(db_id)
    except AppwriteException as e:
        # Database does not exist, create it
        result = databases.create(db_id, 'Community app database')
        print(result)
    
def create_collections(databases: Databases):
    for collection in collections_config:
        print(f"Creating collection: {collection['name']}")
        try:
            databases.get_collection(db_id, collection['collection_id'])
            print(f"Collection {collection['name']} already exists")
            continue
        except AppwriteException as e:
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
 
# Add 'pollOptions' and 'pollResult' fields to the 'Posts' collection schema
def add_poll_fields_to_posts(databases):
    try:
        # Add 'pollOptions' as a string array attribute
        databases.create_string_attribute(
            db_id,
            'posts',
            'pollOptions',
            size=1024,
            required=False
        )
        
        # Add 'pollResult' as a string attribute
        databases.create_string_attribute(
            db_id,
            'posts',
            'pollResult',
            size=255,
            required=False
        )
        print("Poll fields added successfully.")
    except AppwriteException as e:
        print(f"Error adding poll fields: {str(e)}")

 
if __name__ == "__main__":   
    try:
        databases = Databases(client)
        create_database(databases)
        create_collections(databases)
        create_sample_events()
        create_sample_topics()
        #add_poll_fields_to_posts(databases)
        create_sample_posts()
        create_event_like_index()
        create_comments()
    except AppwriteException as e:
        print("Exception: ", e.message)
    
