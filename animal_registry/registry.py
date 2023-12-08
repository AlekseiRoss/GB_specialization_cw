import json
from animal_registry import animal


class AnimalRegistry:
    def __init__(self, filename="animal_registry.json"):
        self.filename = filename
        self.animals = self.load_registry()

    def load_registry(self):
        try:
            with open(self.filename, 'r') as file:
                data = json.load(file)
                animals = [animal.Animal.create_instance(
                    animal_data['id'],
                    animal_data['name'],
                    animal_data['type']
                ) for animal_data in data]
                return animals
        except FileNotFoundError:
            return []

    def save_registry(self):
        data = [animal.to_dict() for animal in self.animals]
        with open(self.filename, 'w') as file:
            json.dump(data, file, indent=2)

    def add_animal(self, animal):
        existing_ids = [a.get_id() for a in self.animals]
        if animal.get_id() in existing_ids:
            print(f"Animal with ID {animal.get_id()} "
                  f"already exists. Please choose a different ID.")
        else:
            self.animals.append(animal)
            self.save_registry()
            print(f"{animal.name} has been added to the registry.")

    def show_animals(self):
        print("List of Animals:")
        for animal in self.animals:
            print(f"{animal.get_id()}. {animal.name}")
