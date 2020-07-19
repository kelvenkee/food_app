const db = require('./api/database')

async function setupDatabase(req, res, next) {
    // To delete all the collections
    const collections = ['users', 'quotes']
    collections.forEach(async (collection) => await deleteCollection(collection))

    // Add documents to the quotes collection
    addDocuments("fooditem", [
        {
            foodName: "Hawaii Supreme Pizza",
            foodDescription:
                "Loads of delicious roasted chicken, shredded chicken juicy pineapples and fresh mushrooms on our brand new pizza.",
            unitPrice: 25.0,
            imageName: 'assets/fooditemsimage/fooditemsimage1.jpg'
        },
        {
            foodName: "Chicken Chop with Black Pepper Sauce",
            foodDescription:
                "Boneless chicken tenders perfectly marinated and battered, so every bite is crispy yet soft. Baked till golden and best paired with dill dipping sauce.",
            unitPrice: 12.50,
            imageName: 'assets/fooditemsimage/fooditemsimage2.jpg'
        },
        {
            foodID: '3',
            foodName: "Fish Fillet Burger",
            foodDescription:
                "A classic favourite of a fish burger served with tartar sauce and cheddar cheese in a steamed bun.",
            unitPrice: 8.90,
            imageName: 'assets/fooditemsimage/fooditemsimage3.jpg'
        },
        {
            foodName: "Nasi Goreng Kampung",
            foodDescription:
                "A traditional Malay style fried rice, also known as Village style fried rice with the fragrant of spices and a hint of chilli.",
            unitPrice: 25.0,
            imageName: 'assets/fooditemsimage/fooditemsimage4.jpg'
        },
        {

            foodName: "Spicy Nacho Cheese Wedges",
            foodDescription:
                "Four Cheese Wedges filled with spicy Jalapeno slices, served with sour cream & chive dip.",
            unitPrice: 5.60,
            imageName: 'assets/fooditemsimage/fooditemsimage5.jpg'
        },
        {
            foodName: "Spaghetti With Chicken Bolognese",
            foodDescription:
                "Spaghetti with traditional mince chincken meat in a fresh tomato sauce.",
            unitPrice: 13.9,
            imageName: 'assets/fooditemsimage/fooditemsimage6.jpg'
        },
        {
            foodName: "Red Velvet Cake",
            foodDescription:
                "Cake that is fluffy, soft, buttery and moist with the most perfect velvet texture.",
            unitPrice: 9.90,
            imageName: 'assets/fooditemsimage/fooditemsimage7.jpg'
        },
        {
            foodName: "Honeydew Juice",
            foodDescription:
                "A fresh and fruity beverage made with sweet honeydew imported from Japan.",
            unitPrice: 8.80,
            imageName: 'assets/fooditemsimage/fooditemsimage8.jpg'
        },
        {
            foodName: "Milo Dinosaur",
            foodDescription:
                "A Malaysian beverage, composed of a cup of iced Milo with undissolved Milo powder added on top of it.",
            unitPrice: 8.70,
            imageName: 'assets/fooditemsimage/fooditemsimage9.jpg'
        },
        {
            foodName: "Cendol with Musang King Durian",
            foodDescription:
                "Iced sweet dessert with droplets of green rice flour jelly, coconut milk and palm sugar syrup. Comes together with Musang King Durian",
            unitPrice: 9.90,
            imageName: 'assets/fooditemsimage/fooditemsimage10.jpg'
        }
    ]);

    addDocuments("customer", [
        { firstname: "Wei Kiat", lastname: "Kang", phone: "017-1235599" },
        { firstname: "Sing Hua", lastname: "Wong", phone: "012-5588964" },
        { firstname: "Lit Kwong", lastname: "Wong", phone: "019-8865423" },
        { firstname: "Kelven", lastname: "Kee", phone: "017-4568596" },
        { firstname: "John", lastname: "Tan", phone: "011-58697495" },
    ]);

    res.send('Setting Up Database.... Done ')
}

async function deleteCollection(collection) {
    const cref = db.firestore.collection(collection)
    const docs = await cref.listDocuments()
    docs.forEach((doc) => doc.delete())
}

function addDocuments(collection, docs) {
    docs.forEach((doc) => db.create(collection, doc))
}

module.exports = setupDatabase