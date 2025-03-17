-- liquibase formatted sql

-- changeset jeff.pell:structure-0001 
CREATE TABLE public.state_border (
	state_name varchar(50) NOT NULL,
	state_name_bordering varchar(50) NOT NULL,
	CONSTRAINT pk_state_border PRIMARY KEY (state_name, state_name_bordering)
);


