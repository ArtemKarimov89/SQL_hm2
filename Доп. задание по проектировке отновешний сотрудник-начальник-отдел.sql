create table if not exists Department(
	id SERIAL primary key,
	name varchar(200),
	unique nulls not distinct (name)
);

create table if not exists Chief(
	id serial primary key,
	department_id integer references Department(id),
	employee_id integer, 
	unique nulls not distinct (employee_id)
);

create table if not exists Employee(
	id SERIAL primary key,
	name varchar(80),
	chief_id integer not null references Chief(id),
	department_id integer references Department(id),
	unique nulls not distinct (name)
);