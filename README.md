# vehicle_insurance_app

Vehicle Insurance Application 
webpage: http://sampleapp.tricentis.com/

---

*Documentation**: [https://a-matta.github.io/vehicle_insurance_app](https://a-matta.github.io/vehicle_insurance_app)

**Source Code**: [https://github.com/a-matta/vehicle_insurance_app](https://github.com/a-matta/vehicle_insurance_app)

---

## Development

* Requirements:
  * [Poetry](https://python-poetry.org/)
  * Python 3.12+
* Clone this repository
* Create a virtual environment and activate it
  ```sh
  poetry shell
  ```
* Install the dependencies
  ```sh
  poetry install
  ```
* Running the tests
  ```sh
  # Uses PyInvoke
  inv tests
  ```
* add the Browser library to dev dependencies
  poetry add --dev robotframework-browser
* run the rfbrowser init inside Poetry's venv (installs Playwright browsers)
  poetry run rfbrowser init
---

This project was generated using the [robotframework-python-cookiecutter](https://github.com/a-matta/robotframework-python-cookiecutter) template.