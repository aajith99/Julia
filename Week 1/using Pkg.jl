
using Pkg
using PkgTemplates
Pkg.add("PkgTemplates")
# Define the template with desired plugins
t = Template(user="ReplaceWithYourGithubUserName", plugins=[GitHubActions(), Codecov()])

generate("my_example_pkg",t)
