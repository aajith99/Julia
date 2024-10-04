using DifferentialEquations
using Plots

# Define the system of differential equations
function f!(du, u, p, t)
    du .= A*u
end

A = [0.5 -0.2; 0.1 0.3]
u0 = [1.0, 0.0]  # initial condition
tspan = (0.0, 50.0)  # time span from 0 to 50

prob = ODEProblem(f!, u0, tspan)
sol = solve(prob)

plot(sol, xlabel="Time", ylabel="y", title="Solution of ODE with parameters", labels=["x1(t)" "x2(t)"])