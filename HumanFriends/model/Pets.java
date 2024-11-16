package model;

import java.util.HashMap;
import java.util.Map;

public abstract class Pets {
    private Map<Integer, String> pets = new HashMap<>();
    private Integer animalId;
    private String animalDescription;
    private static final String petType = "Pets";

    public Pets() {
        pets.put(1, "Dogs");
        pets.put(2, "Cats");
        pets.put(3, "Hamsters");
    }

    public String printPets(){
        StringBuilder sb = new StringBuilder();
        Animals animals = new Animals();
        animalId = animals.getIdByDescription(petType);
        animalDescription = animals.getDescriptionByID(animalId);

        sb.append("Pets: \n");
        for (Map.Entry<Integer, String> entry : pets.entrySet()) {

            sb.append("id: ").append(entry.getKey()).append(", description: ").append(entry.getValue()).append(", ")
                    .append("animalId: ").append(animalId).append(", description: ").append(animalDescription).append("\n");
        }
        return sb.toString();
    }

    public void addNewPetType(String description) {
        int maxKey = -1;
        for(int key: pets.keySet()) {
            if (key > maxKey) {
                maxKey = key;
            }
        }
        pets.put(maxKey + 1, description);
    }

    public void removePetType(String description) {
        Integer keyToRemove = null;
        for(Map.Entry<Integer, String> entry : pets.entrySet()) {
            if(entry.getValue().equals(description)) {
                keyToRemove = entry.getKey();
                break;
            }
        }

        if(keyToRemove == null) {
            throw new IllegalArgumentException("There is no specified pet type");
        } else {
            pets.remove(keyToRemove);
        }
    }

    public Integer getID(String description) {
        int id = -1;
        for(Map.Entry<Integer, String> entry : pets.entrySet()) {
            if(entry.getValue().equals(description)) {
                id = entry.getKey();
                break;
            }
        }
        return id;
    }

    public String getDescriptionByID(Integer id) {
        return pets.get(id);
    }

    public Map<Integer, String> getPetsList() {
        return pets;
    }

    public String printPetTypes() {
        StringBuilder sb = new StringBuilder();

        for (int i = 0; i < pets.size(); i++) {
            if (i < pets.size() -1 ) {
                sb.append(pets.get(i+1)).append(", ");
            } else {
                sb.append(pets.get(i+1));
            }
        }

        return sb.toString();
    }

    public String getPetType () {
        return petType;
    }
}