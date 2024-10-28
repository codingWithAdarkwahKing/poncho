from pymongo import MongoClient

# Replace <password> with the actual password for the king user
password = "kingpassword"
uri = f"mongodb+srv://king:{password}@mongodb.vxupnz9.mongodb.net/ponchodb?retryWrites=true&w=majority"

# Create a new client and connect to the server
client = MongoClient(uri)

# Send a ping to confirm a successful connection
try:
    client.admin.command('ping')
    print("Pinged your deployment. You successfully connected to MongoDB!")
except Exception as e:
    print(e)


# response=$(curl -s -o /dev/null -w "%{http_code}" -X POST -F "username=user1" -F "password=password1" http://localhost/login)