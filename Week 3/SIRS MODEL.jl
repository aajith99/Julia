using DifferentialEquations
using Plots

function sir_model!(dN, N, p, t)
    S, I, Is, R = N
    c, B, ɣ, ps, ɣs, α = p

    N_total = sum(N)  # Total population
    
    dN[1] = - (c * B * I / N_total) * S + (α * R) # dS/dt
    dN[2] = (c * B * I / N_total) * S - ɣ * I * (1 - ps) - (ɣ * ps * I) # dI/dt 
    dN[3] = ɣ * I * (1 - ps) - (ɣs * Is) # dIs/dt
    dN[4] = (ɣs * Is) + ɣ * I * (1 - ps) - (α * R) # dR/dt
end 

# Parameters
c = 10
B = 0.035
ɣ = 0.1
α = 

p = [c, B, ɣ, α]

# Initial conditions
S0 = 4999
I0 = 1
R0 = 0

u0 = [S0, I0, R0] 

# Time span
tspan = (0.0,180.0)

# Define the problem
prob = ODEProblem(sir_model!, u0, tspan, p)

# Solve the problem
sol = solve(prob)

# Plot the solution
p1 = plot(sol, label=["Susceptible" "Infected" "Recovered"], xlabel="Time", ylabel="Population")


#p1 = plot(sol.t,sol[2,:], xlimits=(0,23), ylimits=(0,150), 
#label=["Susceptible" "Infected" "Recovered"], xlabel="Time", ylabel="Population")

# Data for the first 21 days for the number infected
#data = [1.0, 0.0, 5.0, 12.0, 0.0, 12.0, 0.0, 12.0, 11.0, 13.0, 0.0, 17.0, 41.0, 27.0, 20.0, 
#41.0, 47.0, 61.0, 76.0, 113.0, 158.0]
#scatter!(data, xlabel="Time", ylabel="Population", label=["Infected"])

