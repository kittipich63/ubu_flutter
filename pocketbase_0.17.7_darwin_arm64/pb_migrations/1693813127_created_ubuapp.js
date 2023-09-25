/// <reference path="../pb_data/types.d.ts" />
migrate((db) => {
  const collection = new Collection({
    "id": "emkixh5jool0d6o",
    "created": "2023-09-04 07:38:47.167Z",
    "updated": "2023-09-04 07:38:47.167Z",
    "name": "ubuapp",
    "type": "base",
    "system": false,
    "schema": [
      {
        "system": false,
        "id": "ebgdpjhz",
        "name": "courseid",
        "type": "number",
        "required": false,
        "unique": false,
        "options": {
          "min": null,
          "max": null
        }
      },
      {
        "system": false,
        "id": "g6iduajy",
        "name": "title",
        "type": "text",
        "required": false,
        "unique": false,
        "options": {
          "min": null,
          "max": null,
          "pattern": ""
        }
      },
      {
        "system": false,
        "id": "txxhhyuq",
        "name": "lecturer",
        "type": "text",
        "required": false,
        "unique": false,
        "options": {
          "min": null,
          "max": null,
          "pattern": ""
        }
      }
    ],
    "indexes": [],
    "listRule": null,
    "viewRule": null,
    "createRule": null,
    "updateRule": null,
    "deleteRule": null,
    "options": {}
  });

  return Dao(db).saveCollection(collection);
}, (db) => {
  const dao = new Dao(db);
  const collection = dao.findCollectionByNameOrId("emkixh5jool0d6o");

  return dao.deleteCollection(collection);
})
