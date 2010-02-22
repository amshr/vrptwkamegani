function routes=vns(A, capacity)

    B=disttab(A);
    routes=PFIH(A,B,capacity);
    routes=innerVns(routes, A, B, capacity);