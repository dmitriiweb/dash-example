FROM python:3.10

WORKDIR /code

# db migrations
# tests files
# System dependencies
RUN pip install --no-cache-dir "poetry==1.3.2"

# Copy only requirements to cache them in docker layer
COPY poetry.lock .
COPY pyproject.toml .

# Project initialization:
RUN poetry config virtualenvs.create false \
  && poetry install --no-root --no-interaction --no-ansi && rm -rf ~/.cache/pypoetry/cache && rm -rf ~/.cache/pypoetry/artifacts

ENV PYTHONBUFFERED 1
ENV PYTHONPATH="${PYTHONPATH}:/code/"
