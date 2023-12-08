from abc import ABC, abstractmethod


class Animal(ABC):
    def __init__(self, animal_id, name, animal_type):
        self._id = animal_id
        self.name = name
        self.commands = ["Eat", "Sleep"]
        self.animal_type = animal_type  # Добавлено поле animal_type

    def get_id(self):
        return self._id

    @abstractmethod
    def sound(self):
        pass

    def show_commands(self):
        print(
            f"{self.name} can perform the following commands: "
            f"{', '.join(self.commands)}")

    def train(self, new_command):
        self.commands.append(new_command)
        print(f"{self.name} learned a new command: {new_command}")

    def to_dict(self):
        return {'id': self._id, 'name': self.name, 'commands': self.commands,
                'type': self.animal_type}

    @classmethod
    def from_dict(cls, animal_dict):
        animal_id = animal_dict['id']
        name = animal_dict['name']
        animal_type = animal_dict.get('type', None)

        if animal_type is None:
            raise ValueError("Key 'type' is missing in the animal data.")

        instance = cls(animal_id, name, animal_type)
        instance.commands = animal_dict['commands']
        return instance

    @classmethod
    def create_instance(cls, animal_id, name, animal_type):
        if animal_type == 'dog':
            return Dog(animal_id, name, animal_type)
        elif animal_type == 'cat':
            return Cat(animal_id, name, animal_type)
        elif animal_type == 'hamster':
            return Hamster(animal_id, name, animal_type)
        elif animal_type == 'horse':
            return Horse(animal_id, name, animal_type)
        elif animal_type == 'camel':
            return Camel(animal_id, name, animal_type)
        elif animal_type == 'donkey':
            return Donkey(animal_id, name, animal_type)
        else:
            raise ValueError(f"Unknown animal type: {animal_type}")


class DomesticAnimal(Animal):
    def sound(self):
        pass


class HerdingAnimal(Animal):
    def sound(self):
        pass


class Dog(DomesticAnimal):
    def sound(self):
        return "Bark"


class Cat(DomesticAnimal):
    def sound(self):
        return "Meow"


class Hamster(DomesticAnimal):
    def sound(self):
        return "Squeak"


class Horse(HerdingAnimal):
    def sound(self):
        return "Neigh"


class Camel(HerdingAnimal):
    def sound(self):
        return "Grunt"


class Donkey(HerdingAnimal):
    def sound(self):
        return "Bray"
