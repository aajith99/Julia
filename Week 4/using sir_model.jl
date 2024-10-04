using Pkg
using PkgTemplates

t = Template(;
           user="aajith99",
           authors=["Amar Ajith"],
           plugins=[
               License(name="MIT"),
               Git(),
               GitHubActions(),
           ],
       )

generate("sir_model",t)
