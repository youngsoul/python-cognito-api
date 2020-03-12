pip install boto3 -t ./add_notes_deploy/
pip install python-jose -t ./add_notes_deploy/
cp add_note_lambda.py ./add_notes_deploy
cd ./add_notes_deploy; zip -r ../add_notes_deploy.zip .; cd ..