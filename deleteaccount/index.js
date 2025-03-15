import { Client, Users } from "node-appwrite";

// Load environment variables
const client = new Client()
    .setEndpoint(process.env.APPWRITE_ENDPOINT)  // Your Appwrite endpoint
    .setProject(process.env.APPWRITE_PROJECT_ID) // Your Appwrite project ID
    .setKey(process.env.APPWRITE_API_KEY);      // Your Appwrite API Key

const users = new Users(client);

export default async ({ req, res }) => {
    try {
        const { userId } = JSON.parse(req.body);
        
        if (!userId) {
            return res.json({ success: false, message: "User ID required" }, 400);
        }

        await users.delete(userId);
        return res.json({ success: true, message: "User deleted successfully" });
    } catch (error) {
        return res.json({ success: false, message: error.message }, 500);
    }
};
