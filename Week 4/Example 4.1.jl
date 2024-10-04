using DifferentialEquations
using Plots

# Define the basic SIR model
function sir_basic!(du, u, p, t)
    S, I, R = u
    β, γ = p
    N = S + I + R

    # Differential equations
    du[1] = -β * S * I / N
    du[2] = β * S * I / N - γ * I
    du[3] = γ * I
end

# Driver function that selects the appropriate model
function run_model(model::Symbol, u0, p, tspan)
    if model == :basic
        prob = ODEProblem(sir_model!, u0, tspan, p)
    elseif model == :force_of_infection
        prob = ODEProblem(sir_force_of_infection!, u0, tspan, p)
    elseif model == :herd_immunity
        prob = ODEProblem(sir_herd_immunity!, u0, tspan, p)
    else
        error("Unknown model type!")
    end
    solve(prob)
end

# SIR model with force of infection
function sir_force_of_infection!(du, u, p, t)
    S, I, R = u
    β, γ = p
    N = S + I + R

    # Differential equations
    du[1] = -β * S * I / N
    du[2] = β * S * I / N - γ * I
    du[3] = γ * I
end

# SIR model with herd immunity threshold
function sir_herd_immunity!(du, u, p, t)
    S, I, R = u
    β, γ, R_threshold = p
    N = S + I + R

    # Reduce β to 0 when herd immunity threshold is reached
    if R > R_threshold
        β = 0.0
    end

    # Differential equations
    du[1] = -β * S * I / N
    du[2] = β * S * I / N - γ * I
    du[3] = γ * I
end

# Initial conditions:
u0 = [5000.0, 10.0, 0.0] 

# Parameters: 
p_basic = [0.3, 0.1]  # Basic model parameters
p_herd_immunity = [0.3, 0.1, 700.0]  # Threshold set at 700 for herd immunity

# Time span
tspan = (0.0, 100.0)

