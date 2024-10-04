using Plots
using DifferentialEquations

function f!(du, u, p, t)
    a, B = p
    du[1] = -a*u[1] + B
end

u0 = [0.0] # Initial condition
tspan = (0.0, 5.0) # Time span
p = (4.0, 3.0) # Parameters

prob = ODEProblem(f!, u0, tspan, p)

sol = solve(prob)

plot(sol, xlabel="Time", ylabel="y", title="Solution of ODE with parameters")