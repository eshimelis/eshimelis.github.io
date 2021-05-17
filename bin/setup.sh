# Set up Jekyll site. Run this script immediately after cloning the codebase.
# https://github.com/thoughtbot/guides/tree/master/protocol

# Exit if any subcommand fails
set -e

# Set up Ruby dependencies via Bundler.
sudo gem install bundler --conservative
sudo bundle check || bundle install
sudo bundle update

# Set up JS dependencies via Yarn.
sudo npm install -g yarn
sudo yarn install --modules-folder ./_assets/yarn