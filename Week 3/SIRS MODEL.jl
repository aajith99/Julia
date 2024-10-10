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
c = 8 # # Estimated average number of contacts per day of each person
β = 0.035 # # Transmission probability 0.035
ɣ = 0.143 # 7 days to recover from average infections
ps = 0.2 # Range from 15%-25% end up being seriously ill --> I chose 20%
ɣs = 0.071 # Average 2 weeks to recover from serious illness
α = 0.033 # Approximately 1 month to recover

p = [c, β, ɣ, ps, ɣs, α]

# Initial conditions - 6000 total population
S0 = 5999 
I0 = 1
Is0 = 0
R0 = 0

u0 = [S0, I0, Is0, R0] 

# Time span
tspan = (0.0, 25.0) # 25 days 

# Define the problem
prob = ODEProblem(sir_model!, u0, tspan, p)

# Solve the problem
sol = solve(prob)

# Plot the solution
# plot(sol, label=["Susceptible" "Infected" "Severe Infected" "Recovered"], 
# xlabel="Time", ylabel="Population")

plot(sol.t,hcat(sol[2,:], sol[3,:]), xlimits=(0,30), 
label=["Infected" "Severe Infected" "Recovered"], xlabel="Time", ylabel="Population")

data1 = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,11,7,20,3,29,14,11,12,16,10,58]
scatter!(data1, xlabel="Time", ylabel="Population", label=["No. of Infected"])

data2 = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,2,5]
scatter!(data2, xlabel="Time", ylabel="Population", label=["No. of Severe Infected"])
#p1 = plot(sol.t,sol[2,:], xlimits=(0,23), ylimits=(0,150), 
#label=["Susceptible" "Infected" "Recovered"], xlabel="Time", ylabel="Population")

# Data for the first 21 days for the number infected
#scatter!(data, xlabel="Time", ylabel="Population", label=["Infected"])

# Function to calculate reproduction number
#Ro_value = c * β / ɣ   

# Plot the result
#println(Ro_value)