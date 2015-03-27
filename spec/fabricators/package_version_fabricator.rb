Fabricator :package_version do
  version { Faker::App.version }
  content_type 'application/x-tar'
  dependencies { [{ name: Faker::App.name,
      version: Faker::App.version }
  ] }

  development_dependencies { [{ name: Faker::App.name,
      version: Faker::App.version }
  ] }
end
