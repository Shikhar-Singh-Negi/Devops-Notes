FROM node

ENV MONGO_DB_USERNAME=delta_admin \
    MONGO_DB_PWD =password

RUN nkdir -p delta/nodeapp

COPY ./delta/nodeapp

CMD ["node", "/delta/nodeapp/filename"]