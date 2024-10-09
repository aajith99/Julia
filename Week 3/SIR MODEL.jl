
using DifferentialEquations
using Plots

function sir_model(du, u, p, t)
    S, I, R = u
    c, β, ɣ = p
    N = S + I + R

    # Differential equations
    dS = -c * β * S * I / N 
    dI = c * β * S * I / N - ɣ * I
    dR = ɣ * I

    du[1] = dS
    du[2] = dI
    du[3] = dR
end

# Parameters
c = 15 # Estimated average number of contacts per day of each person
β = 0.038 # Transmission probability
ɣ = 0.1 # Recovery Rate

p = [c, β, ɣ]

# Initial conditions - total population of 10000
S0 = 9995
I0 = 5
R0 = 0

u0 = [S0, I0, R0] 

# Time span
tspan = (0.0,30.0)

# Define the problem
prob = ODEProblem(sir_model, u0, tspan, p)

# Solve the problem
sol = solve(prob)

# Plot the solution - Lv3
#plot(sol, label=["Susceptible" "Infected" "Recovered"], xlabel="Time", ylabel="Population")

#infected = sol[2, :]
#peak_infected = maximum(infected)
#peak_time = sol.t[argmax(infected)]
#println("Peak of infected population: $peak_infected at day $peak_time")

# Plot the solution - Lv4
#plot(sol.t,sol[2,:], xlimits=(0,30), 
#label=["Infected"], xlabel="Time", ylabel="Population")

#data = [5, 10, 19, 37, 71, 136, 260, 486, 882, 1516, 2399, 3407, 4300, 4882, 5116, 5080, 4875, 4582, 
#4251, 3913, 3583, 3271, 2979, 2708, 2460, 2233, 2026, 1837, 1665, 1509]

#scatter!(data, xlabel="Time", ylabel="Population", label=["Infected"])


# Function to calculate herd immunity threshold
#function herd_immunity_threshold(Ro)
    #return 1 - 1/Ro
#end

#Ro_value = c * β / ɣ   

#pc_value = herd_immunity_threshold.(Ro_value)

# Plot the result
#println(pc_value)