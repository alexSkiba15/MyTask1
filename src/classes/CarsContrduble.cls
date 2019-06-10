///**
// * Created by Alex on 01.06.2019.
// */
//
//@SuppressWarnings('ApexUnresolvableReference')
//public with sharing class CarsController {
//    public Boolean openWindow { get; set; }
//    public Boolean editWindow { get; set; }
//
//    public String brand { get; set; }
//    public String newBrand { get; set; }
//    public String model { get; set; }
//    public String newModel { get; set; }
//    public Double price { get; set; }
//    public Double newPrice { get; set; }
//    public String year { get; set; }
//    public String newYear { get; set; }
//
//    {
//        openWindow = false;
//        editWindow = false;
//    }
//
//    public List<Car__c> getCars() {
//        List<Car__c> results = Database.query('SELECT Brand__c, Model__c, Price__c, Year__c FROM Car__c ' +
//                'ORDER BY Brand__c ASC');
//        return results;
//    }
//
//    public void addCars() {
//        if (brand != '' && price > 0 && model != '' && year != '') {
//            Car__c car = new Car__c(Name = brand + model + price + year, Brand__c = this.brand, Model__c = this.model, Price__c = this.price, Year__c = this.year);
//            insert car;
//            cleaner();
//        }
//    }
//
//    public void deleteCars() {
//        if (brand != '' && price > 0 && model != '' && year != '') {
//            Car__c del = [
//                    SELECT Name, Brand__c, Model__c, Price__c, Year__c
//                    FROM Car__c
//                    WHERE Brand__c = :brand
//                    AND Model__c = :model
//                    AND Price__c = :price
//                    AND Year__c = :year
//            ];
//            delete del;
//            cleaner();
//        }
//    }
//
//    public void editCars() {
//
//        System.debug(brand);
//        System.debug(model);
//        System.debug(price);
//        System.debug(year);
//        System.debug(newBrand);
//        System.debug(newModel);
//        System.debug(newPrice);
//        System.debug(newYear);
//        if (brand != '' && price > 1 && model != '' && year != '') {
//            List<Car__c> cars = [
//                    SELECT Name
//                    FROM Car__c
//                    WHERE Brand__c = :brand
//                    AND Model__c = :model
//                    AND Price__c = :price
//                    AND Year__c = :year
//            ];
//            if (!cars.isEmpty()) {
//                Car__c newCar = [
//                        SELECT Brand__c, Model__c, Price__c, Year__c
//                        FROM Car__c
//                        WHERE Id = :cars.get(0).Id
//                ];
//                newCar.Name = newBrand + newModel + newPrice + newYear;
//                newCar.Brand__c = newBrand;
//                newCar.Model__c = newModel;
//                newCar.Price__c = newPrice;
//                newCar.Year__c = newYear;
//
//                update newCar;
//
//                closeWindows();
//                System.debug('im here');
//                cleaner();
//                newYear = null;
//                newModel = null;
//                newPrice = null;
//                newBrand = null;
//                editFalse();
//            }
//        }
//    }
//
//    public void editTrue() {
//        editWindow = true;
//        System.debug(model);
//        System.debug(year);
//        System.debug(price);
//        System.debug(brand);
//        System.debug(this.newBrand);
//        System.debug(this.newYear);
//        System.debug(this.newPrice);
//        System.debug(this.newModel);
//    }
//    public void editFalse() {
//        editWindow = false;
//    }
//
//    public PageReference openWindows() {
//        openWindow = true;
//        return null;
//    }
//
//    public PageReference closeWindows() {
//        openWindow = false;
//        return null;
//    }
//
//    public void cleaner() {
//        brand = null;
//        model = null;
//        price = null;
//        year = null;
//    }
//
//   public class CarWrapper {
//        public Car__c car {get; set;}
//        public Boolean isEditMode {get; set;}
//
//        public CarWrapper(Car__c car){
//            this.car = car;
//            this.isEditMode = false;
//        }
//
//        public void saveMe(){
//            upsert this.car;
//        }
//
//        public void toggleEditMode(){
//            this.isEditMode = !this.isEditMode;
//        }
//    }
//}