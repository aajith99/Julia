module LinearODESolver

using DifferentialEquations
using Plots

# 1. Define the system of ODEs
function define_system(A::Matrix, u0::Vector, tspan::Tuple)
    # Define the linear ODE system: du/dt = A * u
    f(u, p, t) = A * u
    prob = ODEProblem(f, u0, tspan)
    return prob
end

# 2. Solve the ODE problem
function solve_system(prob::ODEProblem)
    sol = solve(prob)
    return sol
end

# 3. Plot the solution
function plot_solution(sol)
    plot(sol, xlabel="Time", ylabel="Solution", title="Solution of Linear ODE System")
end

end 