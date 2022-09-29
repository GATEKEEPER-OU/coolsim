# CoolSim
Community Simulator for the GATEKEEPER project.

This project includes several independent modules. 

## Setup
Clone repository and checkout.

The script folder includes a bash script that install all dependencies for all modules

### Setup of the model
Configuration module includes the definition of how the location and agents behave. The definition of the ``configuration`` parameters is included the module [readme](https://github.com/GATEKEEPER-OU/coolsim-configuration).

### Setup of the simulation
In a nutshell, the first step concerns the setup of the agent, community and storage parameters. 

The generation of data generation is triggered by running a community simulation on the simulator engine (simulator) 

Simulator is instantiated by providing a speed setting a speed defining how much time should pass in a real-time second, e.g., 1 hour (default), a day or an arbitrary number of seconds. Simulator can generate native data in the same format of the configuration settings but can be set to generate data in other formats defined as part of the store module (transformers), like FHIR, and where data should be pushed (e.g., live database or file system). 

### Running a simulation
The simulation run is instantiated by providing as input the number of agents and days. 

The simulator module includes a [test file](https://github.com/GATEKEEPER-OU/coolsim-simulator) showcasing how to instantiate the simulator and how to setup a simulation run.

Following an example of how to setup and run a simulation of 1000 agents for 100 days.
```
// instantiation of the simulation engine
Const SimulationEngine = 
new Simulator({save:true,speed:"day",sync:false});
Const days = 100;
Const agents = 1000; 
test(SimulationEngine, agents, days); 

async function test(SimulationEngine, agents,days) {
	// setup the run with the creation of the agent population
   await s.init(agents);
   try {
	// run simulation for a given number o days
      await s.run(days);
   } catch (err){
   	console.error("Error",err);
   }
}
```

# Roadmap
The goal of this project is to build a configurable simulator that can be provided as a servies of the GATEKEEPER platform.
This goal is broken down in the following steps:

- (100% READY) Agent Manager module managing the generation of a given number of Agents. 
  - (90% USABLE) Agent module creates agents based on the model described in the configuration module
    - (100% READY) Agent module creates agents based on the model described in the configuration module
    - (100% READY) Conditions module manages the dynamic and interactions between conditions
    - (100% READY) Actions module manages the selection of activities of agents and their effects
    - (20% NOT USABLE) Interation module will support the role-based interaction between agents, requesting and providing support based on the role definition in the model and within places (defined as a submodule of location)
- (80% USABLE) Store module managing the storage of data and logs in native and FHIR format
- (90% READY) Simulator module managing the creation of agents and the rounds of simulations. A refactory is needed to pass the model as a parameter.
- (30% USABLE) Location module managing the generation of community events that can have positive or negative effects on agents conditions and activities. 
  - (100% READY) Events module generate location-wise events that are used as input for all agents in a specific location
  - (30% NOT USABLE) Interactions module supporting Agents interactions based on community roles yet to be developed)
  - (30% NOT USABLE) Places modules supporting movements of Agents between places and communities 
- (20% NOT USABLE) Viewer module will allow to inspect and manage running simulations and inspect data 
  -  (30% NOT USABLE) Configurator module will guide the creation of the simulation model and simulation parameter, creating a JSON descirption that can be used to prompt the generation of data by the simulator module
- (70% USABLE) Configuration module that manages the model definition parameter
  - (100% USABLE) Utility module including the basic functions used by all modules
- (40% NOT USABLE) Devices module will allow to define the behaviour and distribution to devices that can capture and sample specific type of data and modify conditions and behaviour
