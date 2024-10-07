
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
c = 10 # Estimated average number of contacts per day of each person
β = 0.035 # Transmission probability
ɣ = 0.1 # Recovery Rate

p = [c, β, ɣ]

# Initial conditions - total population of 5000
S0 = 4999
I0 = 1
R0 = 0

u0 = [S0, I0, R0] 

# Time span
tspan = (0.0,180.0)

# Define the problem
prob = ODEProblem(sir_model, u0, tspan, p)

# Solve the problem
sol = solve(prob)

# Plot the solution
plot(sol, label=["Susceptible" "Infected" "Recovered"], xlabel="Time", ylabel="Population")



# Function to calculate herd immunity threshold
#function herd_immunity_threshold(Ro)
    #return 1 - 1/Ro
#end

#Ro_values = 0.1:0.1:30  # Avoid Ro = 0 to prevent division by zero

#pc_values = herd_immunity_threshold.(Ro_values)

# Plot the result
#plot(Ro_values, pc_values, label="Herd Immunity Threshold", xlabel="R₀", 
#ylabel="pc (Herd Immunity Threshold)", lw=2, legend=:topright, 
#title="Herd Immunity Threshold vs R₀")