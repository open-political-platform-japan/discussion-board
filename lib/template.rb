run 'git reset --hard'
run 'git clean -f -d'

generate(:scaffold, "user key:uniq nickname spam:boolean")
generate(:scaffold, "speak user:belongs_to text:text")
generate(:controller, "session new create destroy")
generate(:model, "auth user:belongs_to provider uid omni_hash:text")

run 'rm app/views/layouts/application.html.erb'
run 'rm app/assets/stylesheets/scaffolds.css.scss'

rake("db:migrate:reset")
run 'rm app/views/accounts/*'
generate "bootstrap:themed accounts"
run 'rm app/views/customers/*'
generate "bootstrap:themed customers"
generate "bootstrap:layout application fluid"

generate "sorcery:install brute_force_protection activity_logging"
generate 'acts_as_votable:migration'
