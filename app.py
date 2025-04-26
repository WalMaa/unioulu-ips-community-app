from flask import Flask, request, jsonify
import subprocess

app = Flask(__name__)

# Function to run the Ollama Llama model
import re

def run_llama(prompt):
    try:
        # Debug print the prompt being passed to the model
        print(f"Running command: ollama run deepseek-r1:1.5b \"{prompt}\"")
        
        result = subprocess.run(
            ['ollama', 'run', 'deepseek-r1:1.5b', prompt],  # Pass prompt directly
            capture_output=True, text=True
        )
        
        # Print the result for debugging
        print("Llama Output:", result.stdout)
        if result.stderr:
            print("Llama Error Output:", result.stderr)  # Print stderr in case of errors
        
        # Remove <think> and </think> tags using regex
        cleaned_response = re.sub(r'</?think>', '', result.stdout.strip())
        
        return cleaned_response  # Return the cleaned response
    except Exception as e:
        print("Error:", str(e))  # Print any errors that might occur
        return str(e)


@app.route('/chat', methods=['POST'])
def chat():
    data = request.json
    prompt = data.get('prompt', '')
    print("Received Prompt:", prompt)  # Print the received prompt
    if not prompt:
        return jsonify({"error": "No prompt provided"}), 400
    
    response = run_llama(prompt)
    print("Response from Deepseek:", response)  # Print the response before sending it back
    return jsonify({"response": response})


if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
