--
-- PostgreSQL database dump
--

\restrict peP4baInCnxlbkdXTUlG6gz57AoGj6DbkVsVms15IvJQqI3xsJr3zvzHF1vnGF2

-- Dumped from database version 18.3
-- Dumped by pg_dump version 18.3

-- Started on 2026-06-16 10:43:01

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 4 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: pg_database_owner
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO pg_database_owner;

--
-- TOC entry 4961 (class 0 OID 0)
-- Dependencies: 4
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: pg_database_owner
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 219 (class 1259 OID 24577)
-- Name: road_accident; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.road_accident (
    accident_index character varying(50),
    accident_date date,
    day_of_week character varying(50),
    junction_control character varying(50),
    junction_detail character varying(50),
    accident_severity character varying(50),
    light_conditions character varying(50),
    local_authority character varying(50),
    carriageway_hazards character varying(50),
    number_of_casualties smallint,
    number_of_vehicles smallint,
    police_force character varying(50),
    road_surface_conditions character varying(50),
    road_type character varying(50),
    speed_limit smallint,
    "time" time without time zone,
    urban_or_rural_area character varying(50),
    weather_conditions character varying(50),
    vehicle_type character varying(50)
);


ALTER TABLE public.road_accident OWNER TO postgres;

--
-- TOC entry 4955 (class 0 OID 24577)
-- Dependencies: 219
-- Data for Name: road_accident; Type: TABLE DATA; Schema: public; Owner: postgres
--