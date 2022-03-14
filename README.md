
    Encryption keys generated successfully.
    Personal access client created successfully.
    Client ID: 1
    Client secret: GHXJ7kSRNfEW7W0Jcizg1GTF09wizhHe8SCNa9ad
    Password grant client created successfully.
    Client ID: 2
    Client secret: C0JB93OlOgbqwp2HGlm5JmsJRS1PANezgoDs7wXF

BOAS PRÁTICAS DE PROGRAMAÇAÕ  LARAVEL:

    https://blog.renatolucena.net/post/boas-praticas-laravel

COMANDOS UTIES

    --Criar arquivo para atualizar o banco de dados
    php artisan make:migration nome-do-arquivo

    --Atualiza o banco de dados com os arquivos da pasta database/migrations
    php artisan migrate

    --Gerar chave key no .env
    php artisan key:generate
    
    -- Cria arquivo para migração
    php artisan make:migration usuario

    --Criando arquivo carregar dados iniciais no sistema
    php artisan make:seeder UserSeeder


    --Carga na base de dados
    php artisan db:seed --class=DatabaseSeeder
    
    --Gerar tabelas na base de dados apartir dos arquivos da pasta database/migration
    php artisan migrate
    
    --Executar o comando abaixo quando ocorrer esse erro :  Personal access client not found. Please create one    
    php artisan passport:install --force
