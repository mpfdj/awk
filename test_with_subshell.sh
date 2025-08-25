#!/bin/bash


greeting="hello"
echo $greeting

(
  greeting="bye"
  echo $greeting
)

echo $greeting