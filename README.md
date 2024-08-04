# Emergency Room Visit Navigation Test for ChatGPT by the Japanese Association for Acute Medicine Technology Committee

## Overview
This repository contains code and data used by the Japanese Association for Acute Medicine Technology Committee to test the robustness of ChatGPT answers for determining whether a person needs to visit emergency rooms.

## Repository Structure
- `data`: Directory containing excel files with all the prompts/questions. The prompts are extracted from "Emergency Severity Assessment Protocol Ver. 3: Emergency Consultation Guide (Home Self-Judgment)," provided by the Fire and Disaster Management Agency of the Japan Ministry of Internal Affairs and Communications. The prompts are modified to avoid using medical technical terms.
- `scripts`: Directory containing a Jupyter Notebook that runs the OpenAI API to obtain ChatGPT's responses to the prompts and an R script to create figure 2.
- `output`: Directory where an excel file with all the questions, answers, and the time taken to answer each question are stored. The png and tiff files of figure 2 are also saved.

## How to Run the Test
1. Clone this repository to your local machine.
2. Navigate to the `scripts` directory.
3. Open the Jupyter Notebook and run the cells to send prompts to the ChatGPT API and store the responses in the `output` directory.

## Dependencies
- Python 3
- Jupyter Notebook
- OpenAI API (you will need an API key from OpenAI)

## Contributing
We are not accepting contributions to this project at this time. However, if you find any bugs or issues, please feel free to open an issue in the repository, and we will address it as soon as possible.

## License
This project is licensed under the GNU General Public License (GPL) - see the [LICENSE.md](LICENSE.md) file for details.

## Acknowledgements
We would like to thank the Japanese Association for Acute Medicine for their support and collaboration on this project.
