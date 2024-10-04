using DifferentialEquations
using Plots

function sir_model!(du, u, p, t)
    S, I, Is, R = u
    c, β, ɣ, ps, ɣs, α = p
    N = S + I + Is + R # Total population
    
    du[1] = (-c * β * S * I / N) + (α * R) # dS/dt
    du[2] = (c * β * S * I / N) - (ɣ * (1 - ps) * I) - (ɣ * ps * I) # dI/dt 
    du[3] = (ɣ * ps * I) - (ɣs * Is) # dIs/dt
    du[4] = (ɣs * Is) + (ɣ * (1 - ps) * I) - (α * R) # dR/dt
end 

# Parameters
c = 10 
β = 0.035
ɣ = 0.1 # 10 days on average infections
ps = 0.2 # 20% end up being seriously ill
ɣs = 0.071 # Average 2 weeks to recover from serious illness
α = 0.011 # 90 days or approximately 3 months to recover

p = [c, β, ɣ, ps, ɣs, α]

# Initial conditions
S0 = 4999
I0 = 1
Is0 = 0
R0 = 0

u0 = [S0, I0, Is0, R0] 

# Time span
tspan = (0.0,180.0)

# Define the problem
prob = ODEProblem(sir_model!, u0, tspan, p)

# Solve the problem
sol = solve(prob)

# Plot the solution
p1 = plot(sol, label=["Susceptible" "Infected" "Severe Infected" "Recovered"], 
xlabel="Time", ylabel="Population")


#p1 = plot(sol.t,sol[2,:], xlimits=(0,23), ylimits=(0,150), 
#label=["Susceptible" "Infected" "Recovered"], xlabel="Time", ylabel="Population")

# Data for the first 21 days for the number infected
#data = [1.0, 0.0, 5.0, 12.0, 0.0, 12.0, 0.0, 12.0, 11.0, 13.0, 0.0, 17.0, 41.0, 27.0, 20.0, 
#41.0, 47.0, 61.0, 76.0, 113.0, 158.0]
#scatter!(data, xlabel="Time", ylabel="Population", label=["Infected"])

