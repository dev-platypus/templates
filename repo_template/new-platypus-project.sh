read -p "Enter your GitHub user account: " gh_user
read -p "Enter new project name: " proj_name
read -p "Enter $proj_name's description: " proj_desc
curl -u "$gh_user" https://api.github.com/orgs/dev-platypus/repos -d "{\"name\":\"$proj_name\",\"description\":\"$proj_desc\"}"
git clone https://github.com/dev-platypus/$proj_name
git clone https://github.com/dev-platypus/templates /tmp/platypus-templates
cd $proj_name
scp /tmp/platypus-templates/repo_template/README.md .
scp /tmp/platypus-templates/repo_template/LICENSE .
rm -rf /tmp/platypus-templates
git add -A
git commit -m "Template readme and license included."
git push
