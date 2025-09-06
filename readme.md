# Enhancing Electrokinetic Energy Harvesting via Rheology and Slip-Responsive Zeta Potential

This repository contains the code and data associated with the manuscript:

> **Enhancing Electrokinetic Energy Harvesting via Rheology and Slip-Responsive Zeta Potential**  
> *Aritra Roy (IIT Bombay) and Antarip Poddar IIT (ISM)        Dhanbad*  
 

## 📖 Overview

This work presents a comprehensive theoretical framework to investigate the interaction between slip responsive zeta potential at the channel surface and the complex fluid rheology of the fluid medium modeled using the Carreau-Yashuda constitutive relation. The model in the present study consists of pressure-driven flow through a parallel-plate micro/nanochannel of width $2H$, filled with a symmetric monovalent electrolyte (e.g., NaCl, KCl). The channel walls are **negatively charged** and hydrophobic, characterized by a slip length $L_s$ and a slip-dependent zeta potential $\zeta(L_s)$. A pressure gradient drives ion motion, creating a **streaming potential $E_s$** and an opposing induced electroosmotic flow. The flow is considered fully developed, steady, and symmetric about the channel centerline.

<p align="center">
  <img src="figures/drawing.svg" alt="Schematic of pressure-driven electroosmotic flow" width="600"/>
  <br>
  <em>Schematic of combined pressure-driven and electroosmotic flow in a microchannel.</em>
</p>

We have adopted regular perturbation methodology to solve the coupled electrohydrodynamics equations for low Wiessenberg number (Wi), alongside a numerical solution is also obtained using COMSOL Multiphysics commercial code (using the Finite Element Method). The close agreement of the present results with the earlier studies in the limiting condition of Newtonian fluid medium validates the numerical solution reported in the present work

<p align="center">
  <img src="figures/psivalid.svg" alt="Figure 3a" width="450"/>
  <img src="figures/uy_valid.svg" alt="Figure 3b" width="450"/>
</p>


## 🔬 Connection to Experimental Systems

In order to establish a connection between our theoretical predictions and real experimental systems,  
we identify several electrolyte solutions whose rheological parameters have been measured previously  
and fall within the shear-thinning regime relevant to our study ($n \approx 0.5$).  

Representative examples include:

- **Partially hydrolyzed polyacrylamide (HPAM):** exhibits $n = 0.426$ for molar concentrations $C[\eta] < 30$ 
- **Sodium carboxymethylcellulose (CMC):** in 0.5 M NaCl under unentangled conditions, with reported $n \approx 0.25{-}0.37$ 
- **Hyaluronic acid (HA, 1.6 MDa):** at 0.10 wt.% in PBS, showing $n \approx 0.47{-}0.68$ 

These solutions therefore represent promising candidates for experimental validation, albeit with some inevitable inaccuracies arising from the simplifying assumptions of the present theory.

---
## 📂 Repository Structure


📬 Contact

For questions, reach out to:

Aritra Roy – 25M1662@iitb.ac.in

Antarip Poddar – antarip@iitism.ac.in