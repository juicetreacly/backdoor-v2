from flask import Flask, request, jsonify
import os

app = Flask(__name__)
upload_folder = 'backup_files'

# Ensure the backup directory exists
if not os.path.exists(upload_folder):
    os.makedirs(upload_folder)

@app.route('/upload', methods=['POST'])
def upload_file():
    if 'file' not in request.files:
        return jsonify({'message': 'No file part in the request'}), 400
    file = request.files['file']
    if file.filename == '':
        return jsonify({'message': 'No file selected for uploading'}), 400
    file_path = os.path.join(upload_folder, file.filename)
    file.save(file_path)
    return jsonify({'message': 'File successfully uploaded'}), 200

def print_banner():
    banner = """
    #############################################
    #                                           #
    #         Flask File Upload Server          #
    #                   by                      #
    #              Illusive_Hacks               #
    #############################################
    """
    print(banner)

if __name__ == '__main__':
    print_banner()
    app.run(host='192.168.1.5', port=8888, debug=False)
