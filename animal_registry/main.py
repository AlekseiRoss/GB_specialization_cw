from registry import AnimalRegistry
from animal_registry.animal import DomesticAnimal, Dog, Cat, Hamster, HerdingAnimal, Horse, Camel, Donkey


def main():
    registry = AnimalRegistry()

    while True:
        print("\n1. Add a new animal")
        print("2. Show list of animals")
        print("3. Train animal")
        print("4. Show commands")
        print("5. Exit")

        choice = input("Enter your choice: ")

        if choice == "1":
            animal_id = input("Enter the ID of the animal: ")
            animal_name = input("Enter the name of the animal: ")
            animal_type = input("Enter the type of the animal "
                                "(dog, cat, hamster, horse, camel, donkey): ")

            if animal_type.lower() in ["dog", "cat", "hamster"]:
                new_animal = DomesticAnimal(animal_id, animal_name,
                                            animal_type)

                if animal_type.lower() == "dog":
                    new_animal = Dog(animal_id, animal_name, animal_type)
                elif animal_type.lower() == "cat":
                    new_animal = Cat(animal_id, animal_name, animal_type)
                elif animal_type.lower() == "hamster":
                    new_animal = Hamster(animal_id, animal_name, animal_type)

            elif animal_type.lower() in ["horse", "camel", "donkey"]:
                new_animal = HerdingAnimal(animal_id, animal_name, animal_type)

                if animal_type.lower() == "horse":
                    new_animal = Horse(animal_id, animal_name, animal_type)
                elif animal_type.lower() == "camel":
                    new_animal = Camel(animal_id, animal_name, animal_type)
                elif animal_type.lower() == "donkey":
                    new_animal = Donkey(animal_id, animal_name, animal_type)

            registry.add_animal(new_animal)

        elif choice == "2":
            registry.show_animals()

        elif choice == "3":
            animal_id = input("Enter the ID of the animal you want to train: ")
            animal = next((a for a in registry.animals if a.get_id() == animal_id), None)
            if animal:
                new_command = input("Enter the new command you want to teach "
                                    "the animal: ")
                animal.train(new_command)
                registry.save_registry()
            else:
                print(f"Animal with ID {animal_id} not found.")

        elif choice == "4":
            animal_id = input("Enter the ID of the animal: ")
            animal = next(
                (a for a in registry.animals if a.get_id() == animal_id), None)
            if animal:
                print(animal.commands)
            else:
                print(f"Animal with ID {animal_id} not found.")

        elif choice == "5":
            print("Exiting the program.")
            break

        else:
            print("Invalid choice. Please enter a valid option.")


if __name__ == "__main__":
    main()
