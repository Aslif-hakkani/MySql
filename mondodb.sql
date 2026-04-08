test> use university

university> db.createCollection("students")


university> db.students.insertMany([
| {name: "Aslif", address: "Nintavur",age : 23, department: "CS", gpa: 3.5},{ name: "Bob", address: "California", age: 26, department: "IT", gpa: 3.7 },{ name: "Charlie", address: "Texas", age: 25, department: "Math", gpa: 3.2 },{ name: "David", address: "Florida", age: 27, department: "Physics", gpa: 3.8 },{ name: "Eva", address: "Ohio", age: 24, department: "CS", gpa: 3.6 } ])
{
  acknowledged: true,
  insertedIds: {
    '0': ObjectId('69d68965ed18e9c4aa3682d1'),
    '1': ObjectId('69d68965ed18e9c4aa3682d2'),
    '2': ObjectId('69d68965ed18e9c4aa3682d3'),
    '3': ObjectId('69d68965ed18e9c4aa3682d4'),
    '4': ObjectId('69d68965ed18e9c4aa3682d5')
  }
}
university> db.students.find()
[
  {
    _id: ObjectId('69d68965ed18e9c4aa3682d1'),
    name: 'Aslif',
    address: 'Nintavur',
    age: 23,
    department: 'CS',
    gpa: 3.5
  },
  {
    _id: ObjectId('69d68965ed18e9c4aa3682d2'),
    name: 'Bob',
    address: 'California',
    age: 26,
    department: 'IT',
    gpa: 3.7
  },
  {
    _id: ObjectId('69d68965ed18e9c4aa3682d3'),
    name: 'Charlie',
    address: 'Texas',
    age: 25,
    department: 'Math',
    gpa: 3.2
  },
  {
    _id: ObjectId('69d68965ed18e9c4aa3682d4'),
    name: 'David',
    address: 'Florida',
    age: 27,
    department: 'Physics',
    gpa: 3.8
  },
  {
    _id: ObjectId('69d68965ed18e9c4aa3682d5'),
    name: 'Eva',
    address: 'Ohio',
    age: 24,
    department: 'CS',
    gpa: 3.6
  }
]
university> db.students.find(age:24)
Uncaught:
SyntaxError: Unexpected token, expected "," (1:20)

> 1 | db.students.find(age:24)
    |                     ^
  2 |

university> db.students.find({age:24})
[
  {
    _id: ObjectId('69d68965ed18e9c4aa3682d5'),
    name: 'Eva',
    address: 'Ohio',
    age: 24,
    department: 'CS',
    gpa: 3.6
  }
]
university> db.students.find({age:26,gpa:3.7})
[
  {
    _id: ObjectId('69d68965ed18e9c4aa3682d2'),
    name: 'Bob',
    address: 'California',
    age: 26,
    department: 'IT',
    gpa: 3.7
  }
]
university> db.students.find({age:{$in:25,26}})
Uncaught:
SyntaxError: Unexpected token (1:32)

> 1 | db.students.find({age:{$in:25,26}})
    |                                 ^
  2 |

university> db.students.find({age:{$in:[25,26]}})
[
  {
    _id: ObjectId('69d68965ed18e9c4aa3682d2'),
    name: 'Bob',
    address: 'California',
    age: 26,
    department: 'IT',
    gpa: 3.7
  },
  {
    _id: ObjectId('69d68965ed18e9c4aa3682d3'),
    name: 'Charlie',
    address: 'Texas',
    age: 25,
    department: 'Math',
    gpa: 3.2
  }
]
university> db.students.find({age:{$it:27}})
MongoServerError[BadValue]: unknown operator: $it
university> db.students.find({age:{$lt:27}})
[
  {
    _id: ObjectId('69d68965ed18e9c4aa3682d1'),
    name: 'Aslif',
    address: 'Nintavur',
    age: 23,
    department: 'CS',
    gpa: 3.5
  },
  {
    _id: ObjectId('69d68965ed18e9c4aa3682d2'),
    name: 'Bob',
    address: 'California',
    age: 26,
    department: 'IT',
    gpa: 3.7
  },
  {
    _id: ObjectId('69d68965ed18e9c4aa3682d3'),
    name: 'Charlie',
    address: 'Texas',
    age: 25,
    department: 'Math',
    gpa: 3.2
  },
  {
    _id: ObjectId('69d68965ed18e9c4aa3682d5'),
    name: 'Eva',
    address: 'Ohio',
    age: 24,
    department: 'CS',
    gpa: 3.6
  }
]
university> db.students.updateMany({},{$rename:{"gpa":"cgpa"}})
{
  acknowledged: true,
  insertedId: null,
  matchedCount: 5,
  modifiedCount: 5,
  upsertedCount: 0
}
university> db.students.find()
[
  {
    _id: ObjectId('69d68965ed18e9c4aa3682d1'),
    name: 'Aslif',
    address: 'Nintavur',
    age: 23,
    department: 'CS',
    cgpa: 3.5
  },
  {
    _id: ObjectId('69d68965ed18e9c4aa3682d2'),
    name: 'Bob',
    address: 'California',
    age: 26,
    department: 'IT',
    cgpa: 3.7
  },
  {
    _id: ObjectId('69d68965ed18e9c4aa3682d3'),
    name: 'Charlie',
    address: 'Texas',
    age: 25,
    department: 'Math',
    cgpa: 3.2
  },
  {
    _id: ObjectId('69d68965ed18e9c4aa3682d4'),
    name: 'David',
    address: 'Florida',
    age: 27,
    department: 'Physics',
    cgpa: 3.8
  },
  {
    _id: ObjectId('69d68965ed18e9c4aa3682d5'),
    name: 'Eva',
    address: 'Ohio',
    age: 24,
    department: 'CS',
    cgpa: 3.6
  }
]
university> db.students.updateMany({age:24},{$set:{age:21}})
{
  acknowledged: true,
  insertedId: null,
  matchedCount: 1,
  modifiedCount: 1,
  upsertedCount: 0
}
university> db.students.find()
[
  {
    _id: ObjectId('69d68965ed18e9c4aa3682d1'),
    name: 'Aslif',
    address: 'Nintavur',
    age: 23,
    department: 'CS',
    cgpa: 3.5
  },
  {
    _id: ObjectId('69d68965ed18e9c4aa3682d2'),
    name: 'Bob',
    address: 'California',
    age: 26,
    department: 'IT',
    cgpa: 3.7
  },
  {
    _id: ObjectId('69d68965ed18e9c4aa3682d3'),
    name: 'Charlie',
    address: 'Texas',
    age: 25,
    department: 'Math',
    cgpa: 3.2
  },
  {
    _id: ObjectId('69d68965ed18e9c4aa3682d4'),
    name: 'David',
    address: 'Florida',
    age: 27,
    department: 'Physics',
    cgpa: 3.8
  },
  {
    _id: ObjectId('69d68965ed18e9c4aa3682d5'),
    name: 'Eva',
    address: 'Ohio',
    age: 21,
    department: 'CS',
    cgpa: 3.6
  }
]
university> db.students.find({age:{$gt:23}})
[
  {
    _id: ObjectId('69d68965ed18e9c4aa3682d2'),
    name: 'Bob',
    address: 'California',
    age: 26,
    department: 'IT',
    cgpa: 3.7
  },
  {
    _id: ObjectId('69d68965ed18e9c4aa3682d3'),
    name: 'Charlie',
    address: 'Texas',
    age: 25,
    department: 'Math',
    cgpa: 3.2
  },
  {
    _id: ObjectId('69d68965ed18e9c4aa3682d4'),
    name: 'David',
    address: 'Florida',
    age: 27,
    department: 'Physics',
    cgpa: 3.8
  }
]
university>