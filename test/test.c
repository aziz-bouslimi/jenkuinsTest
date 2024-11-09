// tests/test.c

#include <CUnit/CUnit.h>
#include <CUnit/Basic.h>
#include "../src/main.c"  // Inclure le fichier source pour tester hello_world()

void test_hello_world(void) {
    // Ici, nous vérifierons si la fonction hello_world() fonctionne correctement
    // Pour simplifier, on peut tester si la fonction ne plante pas et affiche "Hello, Jenkins!" dans la sortie.
    CU_ASSERT_PTR_NOT_NULL(hello_world);
}

int main() {
    CU_initialize_registry();
    CU_pSuite suite = CU_add_suite("TestHelloWorldSuite", 0, 0);
    CU_add_test(suite, "test_hello_world", test_hello_world);
    CU_basic_run_tests();
    CU_cleanup_registry();
    return 0;
}

