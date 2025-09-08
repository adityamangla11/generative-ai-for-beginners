#!/bin/bash

# Install OpenAI and Dotenv for Python
# TODO: Check why this can't be done in requirements.txt
pip install python-dotenv
pip install openai

# Install the OpenAI packages for Node.js
# (Python related dependencies are covered in requirements.txt)
# echo "Installing OpenAI For Node.js" 
# npm install --save openai

# Create .env file from codespace secrets if they exist
echo "Setting up environment variables..."

# Create .env file based on .env.copy template
if [ -f ".env.copy" ]; then
    cp .env.copy .env
    echo "Created .env file from template"
    
    # Replace placeholders with actual environment variables if they exist
    if [ ! -z "$OPENAI_API_KEY" ]; then
        sed -i "s|OPENAI_API_KEY='<add your OpenAI API key here>'|OPENAI_API_KEY=$OPENAI_API_KEY|g" .env
        echo "✓ OpenAI API key configured from codespace secret"
    fi
    
    if [ ! -z "$AZURE_OPENAI_API_KEY" ]; then
        sed -i "s|AZURE_OPENAI_API_KEY='<add your AOAI key here>'|AZURE_OPENAI_API_KEY=$AZURE_OPENAI_API_KEY|g" .env
        echo "✓ Azure OpenAI API key configured from codespace secret"
    fi
    
    if [ ! -z "$AZURE_OPENAI_ENDPOINT" ]; then
        sed -i "s|AZURE_OPENAI_ENDPOINT='<add your AOIA service endpoint here>'|AZURE_OPENAI_ENDPOINT=$AZURE_OPENAI_ENDPOINT|g" .env
        echo "✓ Azure OpenAI endpoint configured from codespace secret"
    fi
    
    if [ ! -z "$AZURE_OPENAI_DEPLOYMENT" ]; then
        sed -i "s|AZURE_OPENAI_DEPLOYMENT='<add your chat completion model name here>'|AZURE_OPENAI_DEPLOYMENT=$AZURE_OPENAI_DEPLOYMENT|g" .env
        echo "✓ Azure OpenAI deployment configured from codespace secret"
    fi
    
    if [ ! -z "$AZURE_OPENAI_EMBEDDINGS_DEPLOYMENT" ]; then
        sed -i "s|AZURE_OPENAI_EMBEDDINGS_DEPLOYMENT='<add your embeddings model name here>'|AZURE_OPENAI_EMBEDDINGS_DEPLOYMENT=$AZURE_OPENAI_EMBEDDINGS_DEPLOYMENT|g" .env
        echo "✓ Azure OpenAI embeddings deployment configured from codespace secret"
    fi
    
    if [ ! -z "$HUGGING_FACE_API_KEY" ]; then
        sed -i "s|HUGGING_FACE_API_KEY='<add your HuggingFace API or token here>'|HUGGING_FACE_API_KEY=$HUGGING_FACE_API_KEY|g" .env
        echo "✓ Hugging Face API key configured from codespace secret"
    fi
    
    echo "Environment setup complete! Check .env file for configured values."
else
    echo "Warning: .env.copy template not found"
fi
